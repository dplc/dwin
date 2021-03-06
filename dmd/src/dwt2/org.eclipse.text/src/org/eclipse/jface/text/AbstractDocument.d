/*******************************************************************************
 * Copyright (c) 2000, 2008 IBM Corporation and others.
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


module org.eclipse.jface.text.AbstractDocument;
import org.eclipse.jface.text.IRepairableDocument;
import org.eclipse.jface.text.IDocumentPartitionerExtension3;
import org.eclipse.jface.text.ConfigurableLineTracker;
import org.eclipse.jface.text.IRegion;
import org.eclipse.jface.text.TypedRegion;
import org.eclipse.jface.text.IDocumentExtension2;
import org.eclipse.jface.text.TypedPosition;
import org.eclipse.jface.text.RewriteSessionEditProcessor;
import org.eclipse.jface.text.SlaveDocumentEvent;
import org.eclipse.jface.text.IDocumentExtension3;
import org.eclipse.jface.text.IDocumentListener;
import org.eclipse.jface.text.ISynchronizable;
import org.eclipse.jface.text.DocumentEvent;
import org.eclipse.jface.text.Position;
import org.eclipse.jface.text.IRepairableDocumentExtension;
import org.eclipse.jface.text.DocumentRewriteSessionType;
import org.eclipse.jface.text.Region;
import org.eclipse.jface.text.IDocumentExtension4;
import org.eclipse.jface.text.BadLocationException;
import org.eclipse.jface.text.TextMessages;
import org.eclipse.jface.text.IDocumentPartitioningListenerExtension2;
import org.eclipse.jface.text.IDocumentInformationMappingExtension;
import org.eclipse.jface.text.IDocumentPartitioningListenerExtension;
import org.eclipse.jface.text.ITextStore;
import org.eclipse.jface.text.IDocumentPartitionerExtension;
import org.eclipse.jface.text.DocumentRewriteSession;
import org.eclipse.jface.text.IPositionUpdater;
import org.eclipse.jface.text.ISlaveDocumentManagerExtension;
import org.eclipse.jface.text.ILineTracker;
import org.eclipse.jface.text.ListLineTracker;
import org.eclipse.jface.text.IDocumentRewriteSessionListener;
import org.eclipse.jface.text.IDocumentInformationMapping;
import org.eclipse.jface.text.AbstractLineTracker;
import org.eclipse.jface.text.DefaultLineTracker;
import org.eclipse.jface.text.BadPositionCategoryException;
import org.eclipse.jface.text.BadPartitioningException;
import org.eclipse.jface.text.SequentialRewriteTextStore;
import org.eclipse.jface.text.IDocumentInformationMappingExtension2;
import org.eclipse.jface.text.DocumentPartitioningChangedEvent;
import org.eclipse.jface.text.FindReplaceDocumentAdapter;
import org.eclipse.jface.text.TextUtilities;
import org.eclipse.jface.text.ISlaveDocumentManager;
import org.eclipse.jface.text.IDocument;
import org.eclipse.jface.text.ILineTrackerExtension;
import org.eclipse.jface.text.IDocumentPartitioner;
import org.eclipse.jface.text.GapTextStore;
import org.eclipse.jface.text.Document;
import org.eclipse.jface.text.IDocumentExtension;
import org.eclipse.jface.text.IDocumentPartitioningListener;
import org.eclipse.jface.text.CopyOnWriteTextStore;
import org.eclipse.jface.text.DefaultPositionUpdater;
import org.eclipse.jface.text.Line;
import org.eclipse.jface.text.DocumentRewriteSessionEvent;
import org.eclipse.jface.text.IDocumentPartitionerExtension2;
import org.eclipse.jface.text.ITypedRegion;
import org.eclipse.jface.text.TreeLineTracker;


import java.lang.all;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import org.eclipse.core.runtime.Assert;
import org.eclipse.core.runtime.ListenerList;


/**
 * Abstract default implementation of <code>IDocument</code> and its extension
 * interfaces {@link org.eclipse.jface.text.IDocumentExtension},
 * {@link org.eclipse.jface.text.IDocumentExtension2},
 * {@link org.eclipse.jface.text.IDocumentExtension3},
 * {@link org.eclipse.jface.text.IDocumentExtension4}, as well as
 * {@link org.eclipse.jface.text.IRepairableDocument}.
 * <p>
 *
 * An <code>AbstractDocument</code> supports the following implementation
 * plug-ins:
 * <ul>
 * <li>a text store implementing {@link org.eclipse.jface.text.ITextStore} for
 *     storing and managing the document's content,</li>
 * <li>a line tracker implementing {@link org.eclipse.jface.text.ILineTracker}
 *     to map character positions to line numbers and vice versa</li>
 * </ul>
 * The document can dynamically change the text store when switching between
 * sequential rewrite mode and normal mode.
 * <p>
 *
 * This class must be subclassed. Subclasses must configure which implementation
 * plug-ins the document instance should use. Subclasses are not intended to
 * overwrite existing methods.
 *
 * @see org.eclipse.jface.text.ITextStore
 * @see org.eclipse.jface.text.ILineTracker
 */
public abstract class AbstractDocument : IDocument, IDocumentExtension, IDocumentExtension2, IDocumentExtension3, IDocumentExtension4, IRepairableDocument, IRepairableDocumentExtension {

    /**
     * Tells whether this class is in debug mode.
     * @since 3.1
     */
    private static const bool DEBUG= false;


    /**
     * Inner class to bundle a registered post notification replace operation together with its
     * owner.
     *
     * @since 2.0
     */
    static private class RegisteredReplace {
        /** The owner of this replace operation. */
        IDocumentListener fOwner;
        /** The replace operation */
        IDocumentExtension.IReplace fReplace;

        /**
         * Creates a new bundle object.
         * @param owner the document listener owning the replace operation
         * @param replace the replace operation
         */
        this(IDocumentListener owner, IDocumentExtension.IReplace replace) {
            fOwner= owner;
            fReplace= replace;
        }
    }


    /** The document's text store */
    private ITextStore   fStore;
    /** The document's line tracker */
    private ILineTracker fTracker;
    /** The registered document listeners */
    private ListenerList fDocumentListeners;
    /** The registered pre-notified document listeners */
    private ListenerList fPrenotifiedDocumentListeners;
    /** The registered document partitioning listeners */
    private ListenerList fDocumentPartitioningListeners;
    /** All positions managed by the document ordered by their start positions. */
    private Map fPositions;
    /**
     * All positions managed by the document ordered by there end positions.
     * @since 3.4
     */
    private Map fEndPositions;
    /** All registered document position updaters */
    private List fPositionUpdaters;
    /**
     * The list of post notification changes
     * @since 2.0
     */
    private List fPostNotificationChanges;
    /**
     * The reentrance count for post notification changes.
     * @since 2.0
     */
    private int fReentranceCount= 0;
    /**
     * Indicates whether post notification change processing has been stopped.
     * @since 2.0
     */
    private int fStoppedCount= 0;
    /**
     * Indicates whether the registration of post notification changes should be ignored.
     * @since 2.1
     */
    private bool fAcceptPostNotificationReplaces= true;
    /**
     * Indicates whether the notification of listeners has been stopped.
     * @since 2.1
     */
    private int fStoppedListenerNotification= 0;
    /**
     * The document event to be sent after listener notification has been resumed.
     * @since 2.1
     */
    private DocumentEvent fDeferredDocumentEvent;
    /**
     * The registered document partitioners.
     * @since 3.0
     */
    private Map fDocumentPartitioners;
    /**
     * The partitioning changed event.
     * @since 3.0
     */
    private DocumentPartitioningChangedEvent fDocumentPartitioningChangedEvent;
    /**
     * The find/replace document adapter.
     * @since 3.0
     */
    private FindReplaceDocumentAdapter fFindReplaceDocumentAdapter;
    /**
     * The active document rewrite session.
     * @since 3.1
     */
    private DocumentRewriteSession fDocumentRewriteSession;
    /**
     * The registered document rewrite session listeners.
     * @since 3.1
     */
    private List fDocumentRewriteSessionListeners;
    /**
     * The current modification stamp.
     * @since 3.1
     */
    private long fModificationStamp= IDocumentExtension4.UNKNOWN_MODIFICATION_STAMP;
    /**
     * Keeps track of next modification stamp.
     * @since 3.1.1
     */
    private long fNextModificationStamp= IDocumentExtension4.UNKNOWN_MODIFICATION_STAMP;
    /**
     * This document's default line delimiter.
     * @since 3.1
     */
    private String fInitialLineDelimiter;


    /**
     * The default constructor does not perform any configuration
     * but leaves it to the clients who must first initialize the
     * implementation plug-ins and then call <code>completeInitialization</code>.
     * Results in the construction of an empty document.
     */
    protected this() {
        fModificationStamp= getNextModificationStamp();
    }


    /**
     * Returns the document's text store. Assumes that the
     * document has been initialized with a text store.
     *
     * @return the document's text store
     */
    protected ITextStore getStore() {
        Assert.isNotNull(cast(Object)fStore);
        return fStore;
    }

    /**
     * Returns the document's line tracker. Assumes that the
     * document has been initialized with a line tracker.
     *
     * @return the document's line tracker
     */
    protected ILineTracker getTracker() {
        Assert.isNotNull(cast(Object)fTracker);
        return fTracker;
    }

    /**
     * Returns the document's document listeners.
     *
     * @return the document's document listeners
     */
    protected List getDocumentListeners() {
        return Arrays.asList(fDocumentListeners.getListeners());
    }

    /**
     * Returns the document's partitioning listeners.
     *
     * @return the document's partitioning listeners
     */
    protected List getDocumentPartitioningListeners() {
        return Arrays.asList(fDocumentPartitioningListeners.getListeners());
    }

    /**
     * Returns all positions managed by the document grouped by category.
     *
     * @return the document's positions
     */
    protected Map getDocumentManagedPositions() {
        return fPositions;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getDocumentPartitioner()
     */
    public IDocumentPartitioner getDocumentPartitioner() {
        return getDocumentPartitioner(DEFAULT_PARTITIONING);
    }



    //--- implementation configuration interface ------------

    /**
     * Sets the document's text store.
     * Must be called at the beginning of the constructor.
     *
     * @param store the document's text store
     */
    protected void setTextStore(ITextStore store) {
        fStore= store;
    }

    /**
     * Sets the document's line tracker.
     * Must be called at the beginning of the constructor.
     *
     * @param tracker the document's line tracker
     */
    protected void setLineTracker(ILineTracker tracker) {
        fTracker= tracker;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#setDocumentPartitioner(org.eclipse.jface.text.IDocumentPartitioner)
     */
    public void setDocumentPartitioner(IDocumentPartitioner partitioner) {
        setDocumentPartitioner(DEFAULT_PARTITIONING, partitioner);
    }

    /**
     * Initializes document listeners, positions, and position updaters.
     * Must be called inside the constructor after the implementation plug-ins
     * have been set.
     */
    protected void completeInitialization() {

        fPositions= new HashMap();
        fEndPositions= new HashMap();
        fPositionUpdaters= new ArrayList();
        fDocumentListeners= new ListenerList(ListenerList.IDENTITY);
        fPrenotifiedDocumentListeners= new ListenerList(ListenerList.IDENTITY);
        fDocumentPartitioningListeners= new ListenerList(ListenerList.IDENTITY);
        fDocumentRewriteSessionListeners= new ArrayList();

        addPositionCategory(DEFAULT_CATEGORY);
        addPositionUpdater(new DefaultPositionUpdater(DEFAULT_CATEGORY));
    }


    //-------------------------------------------------------

    /*
     * @see org.eclipse.jface.text.IDocument#addDocumentListener(org.eclipse.jface.text.IDocumentListener)
     */
    public void addDocumentListener(IDocumentListener listener) {
        Assert.isNotNull(cast(Object)listener);
        fDocumentListeners.add(cast(Object)listener);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#removeDocumentListener(org.eclipse.jface.text.IDocumentListener)
     */
    public void removeDocumentListener(IDocumentListener listener) {
        Assert.isNotNull(cast(Object)listener);
        fDocumentListeners.remove(cast(Object)listener);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#addPrenotifiedDocumentListener(org.eclipse.jface.text.IDocumentListener)
     */
    public void addPrenotifiedDocumentListener(IDocumentListener listener) {
        Assert.isNotNull(cast(Object)listener);
        fPrenotifiedDocumentListeners.add(cast(Object)listener);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#removePrenotifiedDocumentListener(org.eclipse.jface.text.IDocumentListener)
     */
    public void removePrenotifiedDocumentListener(IDocumentListener listener) {
        Assert.isNotNull(cast(Object)listener);
        fPrenotifiedDocumentListeners.remove(cast(Object)listener);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#addDocumentPartitioningListener(org.eclipse.jface.text.IDocumentPartitioningListener)
     */
    public void addDocumentPartitioningListener(IDocumentPartitioningListener listener) {
        Assert.isNotNull(cast(Object)listener);
        fDocumentPartitioningListeners.add(cast(Object)listener);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#removeDocumentPartitioningListener(org.eclipse.jface.text.IDocumentPartitioningListener)
     */
    public void removeDocumentPartitioningListener(IDocumentPartitioningListener listener) {
        Assert.isNotNull(cast(Object)listener);
        fDocumentPartitioningListeners.remove(cast(Object)listener);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#addPosition(java.lang.String, org.eclipse.jface.text.Position)
     */
    public void addPosition(String category, Position position)  {

        if ((0 > position.offset) || (0 > position.length) || (position.offset + position.length > getLength()))
            throw new BadLocationException();

        if (category is null)
            throw new BadPositionCategoryException();

        List list= cast(List) fPositions.get(category);
        if (list is null)
            throw new BadPositionCategoryException();
        list.add(computeIndexInPositionList(list, position.offset), position);

        List endPositions= cast(List) fEndPositions.get(category);
        if (endPositions is null)
            throw new BadPositionCategoryException();
        endPositions.add(computeIndexInPositionList(endPositions, position.offset + position.length - 1, false), position);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#addPosition(org.eclipse.jface.text.Position)
     */
    public void addPosition(Position position)  {
        try {
            addPosition(DEFAULT_CATEGORY, position);
        } catch (BadPositionCategoryException e) {
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocument#addPositionCategory(java.lang.String)
     */
    public void addPositionCategory(String category) {

        if (category is null)
            return;

        if (!containsPositionCategory(category)) {
            fPositions.put(category, new ArrayList());
            fEndPositions.put(category, new ArrayList());
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocument#addPositionUpdater(org.eclipse.jface.text.IPositionUpdater)
     */
    public void addPositionUpdater(IPositionUpdater updater) {
        insertPositionUpdater(updater, fPositionUpdaters.size());
    }

    /*
     * @see org.eclipse.jface.text.IDocument#containsPosition(java.lang.String, int, int)
     */
    public bool containsPosition(String category, int offset, int length) {

        if (category is null)
            return false;

        List list= cast(List) fPositions.get(category);
        if (list is null)
            return false;

        int size= list.size();
        if (size is 0)
            return false;

        int index= computeIndexInPositionList(list, offset);
        if (index < size) {
            Position p= cast(Position) list.get(index);
            while (p !is null && p.offset is offset) {
                if (p.length is length)
                    return true;
                ++ index;
                p= (index < size) ? cast(Position) list.get(index) : null;
            }
        }

        return false;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#containsPositionCategory(java.lang.String)
     */
    public bool containsPositionCategory(String category) {
        if (category !is null)
            return fPositions.containsKey(category);
        return false;
    }


    /**
     * Computes the index in the list of positions at which a position with the given
     * offset would be inserted. The position is supposed to become the first in this list
     * of all positions with the same offset.
     *
     * @param positions the list in which the index is computed
     * @param offset the offset for which the index is computed
     * @return the computed index
     *
     * @see IDocument#computeIndexInCategory(String, int)
     * @deprecated As of 3.4, replaced by {@link #computeIndexInPositionList(List, int, bool)}
     */
    protected int computeIndexInPositionList(List positions, int offset) {
        return computeIndexInPositionList(positions, offset, true);
    }

    /**
     * Computes the index in the list of positions at which a position with the given
     * position would be inserted. The position to insert is supposed to become the first
     * in this list of all positions with the same position.
     *
     * @param positions the list in which the index is computed
     * @param offset the offset for which the index is computed
     * @param orderedByOffset <code>true</code> if ordered by offset, false if ordered by end position
     * @return the computed index
     * @since 3.4
     */
    protected int computeIndexInPositionList(List positions, int offset, bool orderedByOffset) {
        if (positions.size() is 0)
            return 0;

        int left= 0;
        int right= positions.size() -1;
        int mid= 0;
        Position p= null;

        while (left < right) {

            mid= (left + right) / 2;

            p= cast(Position) positions.get(mid);
            int pOffset= getOffset(orderedByOffset, p);
            if (offset < pOffset) {
                if (left is mid)
                    right= left;
                else
                    right= mid -1;
            } else if (offset > pOffset) {
                if (right is mid)
                    left= right;
                else
                    left= mid  +1;
            } else if (offset is pOffset) {
                left= right= mid;
            }

        }

        int pos= left;
        p= cast(Position) positions.get(pos);
        int pPosition= getOffset(orderedByOffset, p);
        if (offset > pPosition) {
            // append to the end
            pos++;
        } else {
            // entry will become the first of all entries with the same offset
            do {
                --pos;
                if (pos < 0)
                    break;
                p= cast(Position) positions.get(pos);
                pPosition= getOffset(orderedByOffset, p);
            } while (offset is pPosition);
            ++pos;
        }

        Assert.isTrue(0 <= pos && pos <= positions.size());

        return pos;
    }

    /*
     * @since 3.4
     */
    private int getOffset(bool orderedByOffset, Position position) {
        if (orderedByOffset || position.getLength() is 0)
            return position.getOffset();
        return position.getOffset() + position.getLength() - 1;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#computeIndexInCategory(java.lang.String, int)
     */
    public int computeIndexInCategory(String category, int offset)  {

        if (0 > offset || offset > getLength())
            throw new BadLocationException();

        List c= cast(List) fPositions.get(category);
        if (c is null)
            throw new BadPositionCategoryException();

        return computeIndexInPositionList(c, offset);
    }

    /**
     * Fires the document partitioning changed notification to all registered
     * document partitioning listeners. Uses a robust iterator.
     *
     * @deprecated as of 2.0. Use <code>fireDocumentPartitioningChanged(IRegion)</code> instead.
     */
    protected void fireDocumentPartitioningChanged() {
        if (fDocumentPartitioningListeners is null)
            return;

        Object[] listeners= fDocumentPartitioningListeners.getListeners();
        for (int i= 0; i < listeners.length; i++)
            (cast(IDocumentPartitioningListener)listeners[i]).documentPartitioningChanged(this);
    }

    /**
     * Fires the document partitioning changed notification to all registered
     * document partitioning listeners. Uses a robust iterator.
     *
     * @param region the region in which partitioning has changed
     *
     * @see IDocumentPartitioningListenerExtension
     * @since 2.0
     * @deprecated as of 3.0. Use
     *             <code>fireDocumentPartitioningChanged(DocumentPartitioningChangedEvent)</code>
     *             instead.
     */
    protected void fireDocumentPartitioningChanged(IRegion region) {
        if (fDocumentPartitioningListeners is null)
            return;

        Object[] listeners= fDocumentPartitioningListeners.getListeners();
        for (int i= 0; i < listeners.length; i++) {
            IDocumentPartitioningListener l= cast(IDocumentPartitioningListener)listeners[i];
            if ( cast(IDocumentPartitioningListenerExtension)l )
                (cast(IDocumentPartitioningListenerExtension) l).documentPartitioningChanged(this, region);
            else
                l.documentPartitioningChanged(this);
        }
    }

    /**
     * Fires the document partitioning changed notification to all registered
     * document partitioning listeners. Uses a robust iterator.
     *
     * @param event the document partitioning changed event
     *
     * @see IDocumentPartitioningListenerExtension2
     * @since 3.0
     */
    protected void fireDocumentPartitioningChanged(DocumentPartitioningChangedEvent event) {
        if (fDocumentPartitioningListeners is null)
            return;

        Object[] listeners= fDocumentPartitioningListeners.getListeners();
        for (int i= 0; i < listeners.length; i++) {
            IDocumentPartitioningListener l= cast(IDocumentPartitioningListener)listeners[i];
            if ( cast(IDocumentPartitioningListenerExtension2)l ) {
                IDocumentPartitioningListenerExtension2 extension2= cast(IDocumentPartitioningListenerExtension2) l;
                extension2.documentPartitioningChanged(event);
            } else if ( cast(IDocumentPartitioningListenerExtension)l ) {
                IDocumentPartitioningListenerExtension extension= cast(IDocumentPartitioningListenerExtension) l;
                extension.documentPartitioningChanged(this, event.getCoverage());
            } else {
                l.documentPartitioningChanged(this);
            }
        }
    }

    /**
     * Fires the given document event to all registers document listeners informing them
     * about the forthcoming document manipulation. Uses a robust iterator.
     *
     * @param event the event to be sent out
     */
    protected void fireDocumentAboutToBeChanged(DocumentEvent event) {

        // IDocumentExtension
        if (fReentranceCount is 0)
            flushPostNotificationChanges();

        if (fDocumentPartitioners !is null) {
            Iterator e= fDocumentPartitioners.values().iterator();
            while (e.hasNext()) {
                IDocumentPartitioner p= cast(IDocumentPartitioner) e.next();
                if ( cast(IDocumentPartitionerExtension3)p ) {
                    IDocumentPartitionerExtension3 extension= cast(IDocumentPartitionerExtension3) p;
                    if (extension.getActiveRewriteSession() !is null)
                        continue;
                }
                p.documentAboutToBeChanged(event);
            }
        }

        Object[] listeners= fPrenotifiedDocumentListeners.getListeners();
        for (int i= 0; i < listeners.length; i++)
            (cast(IDocumentListener)listeners[i]).documentAboutToBeChanged(event);

        listeners= fDocumentListeners.getListeners();
        for (int i= 0; i < listeners.length; i++)
            (cast(IDocumentListener)listeners[i]).documentAboutToBeChanged(event);
    }


    /**
     * Updates document partitioning and document positions according to the
     * specification given by the document event.
     *
     * @param event the document event describing the change to which structures must be adapted
     */
    protected void updateDocumentStructures(DocumentEvent event) {

        if (fDocumentPartitioners !is null) {
            fDocumentPartitioningChangedEvent= new DocumentPartitioningChangedEvent(this);
            Iterator e= fDocumentPartitioners.keySet().iterator();
            while (e.hasNext()) {
                String partitioning= stringcast( e.next() );
                IDocumentPartitioner partitioner= cast(IDocumentPartitioner) fDocumentPartitioners.get(partitioning);

                if ( cast(IDocumentPartitionerExtension3)partitioner ) {
                    IDocumentPartitionerExtension3 extension= cast(IDocumentPartitionerExtension3) partitioner;
                    if (extension.getActiveRewriteSession() !is null)
                        continue;
                }

                if ( cast(IDocumentPartitionerExtension)partitioner ) {
                    IDocumentPartitionerExtension extension= cast(IDocumentPartitionerExtension) partitioner;
                    IRegion r= extension.documentChanged2(event);
                    if (r !is null)
                        fDocumentPartitioningChangedEvent.setPartitionChange(partitioning, r.getOffset(), r.getLength());
                } else {
                    if (partitioner.documentChanged(event))
                        fDocumentPartitioningChangedEvent.setPartitionChange(partitioning, 0, event.getDocument().getLength());
                }
            }
        }

        if (fPositions.size() > 0)
            updatePositions(event);
    }

    /**
     * Notifies all listeners about the given document change. Uses a robust
     * iterator.
     * <p>
     * Executes all registered post notification replace operation.
     *
     * @param event the event to be sent out.
     */
    protected void doFireDocumentChanged(DocumentEvent event) {
        bool changed= fDocumentPartitioningChangedEvent !is null && !fDocumentPartitioningChangedEvent.isEmpty();
        IRegion change= changed ? fDocumentPartitioningChangedEvent.getCoverage() : null;
        doFireDocumentChanged(event, changed, change);
    }

    /**
     * Notifies all listeners about the given document change.
     * Uses a robust iterator. <p>
     * Executes all registered post notification replace operation.
     *
     * @param event the event to be sent out
     * @param firePartitionChange <code>true</code> if a partition change notification should be sent
     * @param partitionChange the region whose partitioning changed
     * @since 2.0
     * @deprecated as of 3.0. Use <code>doFireDocumentChanged2(DocumentEvent)</code> instead; this method will be removed.
     */
    protected void doFireDocumentChanged(DocumentEvent event, bool firePartitionChange, IRegion partitionChange) {
        doFireDocumentChanged2(event);
    }

    /**
     * Notifies all listeners about the given document change. Uses a robust
     * iterator.
     * <p>
     * Executes all registered post notification replace operation.
     * <p>
     * This method will be renamed to <code>doFireDocumentChanged</code>.
     *
     * @param event the event to be sent out
     * @since 3.0
     */
    protected void doFireDocumentChanged2(DocumentEvent event) {

        DocumentPartitioningChangedEvent p= fDocumentPartitioningChangedEvent;
        fDocumentPartitioningChangedEvent= null;
        if (p !is null && !p.isEmpty())
            fireDocumentPartitioningChanged(p);

        Object[] listeners= fPrenotifiedDocumentListeners.getListeners();
        for (int i= 0; i < listeners.length; i++)
            (cast(IDocumentListener)listeners[i]).documentChanged(event);

        listeners= fDocumentListeners.getListeners();
        for (int i= 0; i < listeners.length; i++)
            (cast(IDocumentListener)listeners[i]).documentChanged(event);

        // IDocumentExtension
        ++ fReentranceCount;
        try {
            if (fReentranceCount is 1)
                executePostNotificationChanges();
        } finally {
            -- fReentranceCount;
        }
    }

    /**
     * Updates the internal document structures and informs all document listeners
     * if listener notification has been enabled. Otherwise it remembers the event
     * to be sent to the listeners on resume.
     *
     * @param event the document event to be sent out
     */
    protected void fireDocumentChanged(DocumentEvent event) {
        updateDocumentStructures(event);

        if (fStoppedListenerNotification is 0)
            doFireDocumentChanged(event);
        else
            fDeferredDocumentEvent= event;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getChar(int)
     */
    public char getChar(int pos)  {
        if ((0 > pos) || (pos >= getLength()))
            throw new BadLocationException();
        return getStore().get(pos);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getContentType(int)
     */
    public String getContentType(int offset)  {
        String contentType= null;
        try {
            contentType= getContentType(DEFAULT_PARTITIONING, offset, false);
            //Assert.isNotNull(contentType);
        } catch (BadPartitioningException e) {
            Assert.isTrue(false);
        }
        return contentType;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLegalContentTypes()
     */
    public String[] getLegalContentTypes() {
        String[] contentTypes= null;
        try {
            contentTypes= getLegalContentTypes(DEFAULT_PARTITIONING);
            //Assert.isNotNull(contentTypes);
        } catch (BadPartitioningException e) {
            Assert.isTrue(false);
        }
        return contentTypes;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLength()
     */
    public int getLength() {
        return getStore().getLength();
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLineDelimiter(int)
     */
    public String getLineDelimiter(int line)  {
        return getTracker().getLineDelimiter(line);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLegalLineDelimiters()
     */
    public String[] getLegalLineDelimiters() {
        return getTracker().getLegalLineDelimiters();
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#getDefaultLineDelimiter()
     * @since 3.1
     */
    public String getDefaultLineDelimiter() {

        String lineDelimiter= null;

        try {
            lineDelimiter= getLineDelimiter(0);
        } catch (BadLocationException x) {
        }

        if (lineDelimiter !is null)
            return lineDelimiter;

        if (fInitialLineDelimiter !is null)
            return fInitialLineDelimiter;

        String sysLineDelimiter= System.getProperty("line.separator"); //$NON-NLS-1$
        String[] delimiters= getLegalLineDelimiters();
        Assert.isTrue(delimiters.length > 0);
        for (int i= 0; i < delimiters.length; i++) {
            if (delimiters[i].equals(sysLineDelimiter)) {
                lineDelimiter= sysLineDelimiter;
                break;
            }
        }

        if (lineDelimiter is null)
            lineDelimiter= delimiters[0];

        return lineDelimiter;

    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#setInitialLineDelimiter(java.lang.String)
     * @since 3.1
     */
    public void setInitialLineDelimiter(String lineDelimiter) {
        Assert.isNotNull(lineDelimiter);
        fInitialLineDelimiter= lineDelimiter;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLineLength(int)
     */
    public int getLineLength(int line)  {
        return getTracker().getLineLength(line);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLineOfOffset(int)
     */
    public int getLineOfOffset(int pos)  {
        return getTracker().getLineNumberOfOffset(pos);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLineOffset(int)
     */
    public int getLineOffset(int line)  {
        return getTracker().getLineOffset(line);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLineInformation(int)
     */
    public IRegion getLineInformation(int line)  {
        return getTracker().getLineInformation(line);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getLineInformationOfOffset(int)
     */
    public IRegion getLineInformationOfOffset(int offset)  {
        return getTracker().getLineInformationOfOffset(offset);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getNumberOfLines()
     */
    public int getNumberOfLines() {
        return getTracker().getNumberOfLines();
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getNumberOfLines(int, int)
     */
    public int getNumberOfLines(int offset, int length)  {
        return getTracker().getNumberOfLines(offset, length);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#computeNumberOfLines(java.lang.String)
     */
    public int computeNumberOfLines(String text) {
        return getTracker().computeNumberOfLines(text);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getPartition(int)
     */
    public ITypedRegion getPartition(int offset)  {
        ITypedRegion partition= null;
        try {
            partition= getPartition(DEFAULT_PARTITIONING, offset, false);
//             Assert.isNotNull(cast(Object)partition);
        } catch (BadPartitioningException e) {
            Assert.isTrue(false);
        }
        return  partition;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#computePartitioning(int, int)
     */
    public ITypedRegion[] computePartitioning(int offset, int length)  {
        ITypedRegion[] partitioning= null;
        try {
            partitioning= computePartitioning(DEFAULT_PARTITIONING, offset, length, false);
//             Assert.isNotNull(cast(Object)partitioning);
        } catch (BadPartitioningException e) {
            Assert.isTrue(false);
        }
        return partitioning;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getPositions(java.lang.String)
     */
    public Position[] getPositions(String category)  {

        if (category is null)
            throw new BadPositionCategoryException();

        List c= cast(List) fPositions.get(category);
        if (c is null)
            throw new BadPositionCategoryException();

        Position[] positions= new Position[c.size()];
        c.toArray(positions);
        return positions;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getPositionCategories()
     */
    public String[] getPositionCategories() {
        String[] categories= new String[fPositions.size()];
        Iterator keys= fPositions.keySet().iterator();
        for (int i= 0; i < categories.length; i++)
            categories[i]= stringcast( keys.next());
        return categories;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#getPositionUpdaters()
     */
    public IPositionUpdater[] getPositionUpdaters() {
        return arraycast!(IPositionUpdater)(fPositionUpdaters.toArray());
    }

    /*
     * @see org.eclipse.jface.text.IDocument#get()
     */
    public String get() {
        return getStore().get(0, getLength());
    }

    /*
     * @see org.eclipse.jface.text.IDocument#get(int, int)
     */
    public String get(int pos, int length)  {
        int myLength= getLength();
        if ((0 > pos) || (0 > length) || (pos + length > myLength))
            throw new BadLocationException();
        return getStore().get(pos, length);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#insertPositionUpdater(org.eclipse.jface.text.IPositionUpdater, int)
     */
    public void insertPositionUpdater(IPositionUpdater updater, int index) {

        for (int i= fPositionUpdaters.size() - 1; i >= 0; i--) {
            if (fPositionUpdaters.get(i) is cast(Object)updater)
                return;
        }

        if (index is fPositionUpdaters.size())
            fPositionUpdaters.add(cast(Object)updater);
        else
            fPositionUpdaters.add(index, cast(Object)updater);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#removePosition(java.lang.String, org.eclipse.jface.text.Position)
     */
    public void removePosition(String category, Position position)  {

        if (position is null)
            return;

        if (category is null)
            throw new BadPositionCategoryException();

        List c= cast(List) fPositions.get(category);
        if (c is null)
            throw new BadPositionCategoryException();
        removeFromPositionsList(c, position, true);

        List endPositions= cast(List) fEndPositions.get(category);
        if (endPositions is null)
            throw new BadPositionCategoryException();
        removeFromPositionsList(endPositions, position, false);
    }

    /**
     * Remove the given position form the given list of positions based on identity not equality.
     *
     * @param positions a list of positions
     * @param position the position to remove
     * @param orderedByOffset true if <code>positions</code> is ordered by offset, false if ordered by end position
     * @since 3.4
     */
    private void removeFromPositionsList(List positions, Position position, bool orderedByOffset) {
        int size= positions.size();

        //Assume position is somewhere near it was before
        int index= computeIndexInPositionList(positions, orderedByOffset ? position.offset : position.offset + position.length - 1, orderedByOffset);
        if (index < size && positions.get(index) is position) {
            positions.remove(index);
            return;
        }

        int back= index - 1;
        int forth= index + 1;
        while (back >= 0 || forth < size) {
            if (back >= 0) {
                if (position is positions.get(back)) {
                    positions.remove(back);
                    return;
                }
                back--;
            }

            if (forth < size) {
                if (position is positions.get(forth)) {
                    positions.remove(forth);
                    return;
                }
                forth++;
            }
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocument#removePosition(org.eclipse.jface.text.Position)
     */
    public void removePosition(Position position) {
        try {
            removePosition(DEFAULT_CATEGORY, position);
        } catch (BadPositionCategoryException e) {
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocument#removePositionCategory(java.lang.String)
     */
    public void removePositionCategory(String category)  {

        if (category is null)
            return;

        if ( !containsPositionCategory(category))
            throw new BadPositionCategoryException();

        fPositions.remove(category);
        fEndPositions.remove(category);
    }

    /*
     * @see org.eclipse.jface.text.IDocument#removePositionUpdater(org.eclipse.jface.text.IPositionUpdater)
     */
    public void removePositionUpdater(IPositionUpdater updater) {
        for (int i= fPositionUpdaters.size() - 1; i >= 0; i--) {
            if (fPositionUpdaters.get(i) is cast(Object)updater) {
                fPositionUpdaters.remove(i);
                return;
            }
        }
    }

    private long getNextModificationStamp() {
        if (fNextModificationStamp is Long.MAX_VALUE || fNextModificationStamp is IDocumentExtension4.UNKNOWN_MODIFICATION_STAMP)
            fNextModificationStamp= 0;
        else
            fNextModificationStamp= fNextModificationStamp + 1;

        return fNextModificationStamp;
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#getModificationStamp()
     * @since 3.1
     */
    public long getModificationStamp() {
        return fModificationStamp;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#replace(int, int, java.lang.String)
     * @since 3.1
     */
    public void replace(int pos, int length, String text, long modificationStamp)  {
        if ((0 > pos) || (0 > length) || (pos + length > getLength()))
            throw new BadLocationException();

        DocumentEvent e= new DocumentEvent(this, pos, length, text);
        fireDocumentAboutToBeChanged(e);

        getStore().replace(pos, length, text);
        getTracker().replace(pos, length, text);

        fModificationStamp= modificationStamp;
        fNextModificationStamp= Math.max(fModificationStamp, fNextModificationStamp);
        e.fModificationStamp= fModificationStamp;

        fireDocumentChanged(e);
    }

    /**
     * {@inheritDoc}
     *
     * @since 3.4
     */
    public bool isLineInformationRepairNeeded(int offset, int length, String text)  {
        return false;
    }

    /*
     * @see org.eclipse.jface.text.IDocument#replace(int, int, java.lang.String)
     */
    public void replace(int pos, int length, String text)  {
        if (length is 0 && (text is null || text.length is 0))
            replace(pos, length, text, getModificationStamp());
        else
            replace(pos, length, text, getNextModificationStamp());
    }

    /*
     * @see org.eclipse.jface.text.IDocument#set(java.lang.String)
     */
    public void set(String text) {
        set(text, getNextModificationStamp());
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#set(java.lang.String, long)
     * @since 3.1
     */
    public void set(String text, long modificationStamp) {
        int length= getStore().getLength();

        DocumentEvent e= new DocumentEvent(this, 0, length, text);
        fireDocumentAboutToBeChanged(e);

        getStore().set(text);
        getTracker().set(text);

        fModificationStamp= modificationStamp;
        fNextModificationStamp= Math.max(fModificationStamp, fNextModificationStamp);
        e.fModificationStamp= fModificationStamp;

        fireDocumentChanged(e);
    }

    /**
     * Updates all positions of all categories to the change described by the
     * document event. All registered document updaters are called in the
     * sequence they have been arranged. Uses a robust iterator.
     *
     * @param event the document event describing the change to which to adapt
     *            the positions
     */
    protected void updatePositions(DocumentEvent event) {
        List list= new ArrayList(fPositionUpdaters);
        Iterator e= list.iterator();
        while (e.hasNext()) {
            IPositionUpdater u= cast(IPositionUpdater) e.next();
            u.update(event);
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocument#search(int, java.lang.String, bool, bool, bool)
     */
    public int search(int startPosition, String findString, bool forwardSearch, bool caseSensitive, bool wholeWord)  {
        try {
            IRegion region= getFindReplaceDocumentAdapter().find(startPosition, findString, forwardSearch, caseSensitive, wholeWord, false);
            return region is null ?  -1 : region.getOffset();
        } catch (IllegalStateException ex) {
            return -1;
        } catch (PatternSyntaxException ex) {
            return -1;
        }
    }

    /**
     * Returns the find/replace adapter for this document.
     *
     * @return this document's find/replace document adapter
     * @since 3.0
     */
    private FindReplaceDocumentAdapter getFindReplaceDocumentAdapter() {
        if (fFindReplaceDocumentAdapter is null)
            fFindReplaceDocumentAdapter= new FindReplaceDocumentAdapter(this);

        return fFindReplaceDocumentAdapter;
    }

    /**
     * Flushes all registered post notification changes.
     *
     * @since 2.0
     */
    private void flushPostNotificationChanges() {
        if (fPostNotificationChanges !is null)
            fPostNotificationChanges.clear();
    }

    /**
     * Executes all registered post notification changes. The process is
     * repeated until no new post notification changes are added.
     *
     * @since 2.0
     */
    private void executePostNotificationChanges() {

        if (fStoppedCount > 0)
            return;

        while (fPostNotificationChanges !is null) {
            List changes= fPostNotificationChanges;
            fPostNotificationChanges= null;

            Iterator e= changes.iterator();
            while (e.hasNext()) {
                RegisteredReplace replace= cast(RegisteredReplace) e.next();
                replace.fReplace.perform(this, replace.fOwner);
            }
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension2#acceptPostNotificationReplaces()
     * @since 2.1
     */
    public void acceptPostNotificationReplaces() {
        fAcceptPostNotificationReplaces= true;
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension2#ignorePostNotificationReplaces()
     * @since 2.1
     */
    public void ignorePostNotificationReplaces() {
        fAcceptPostNotificationReplaces= false;
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension#registerPostNotificationReplace(org.eclipse.jface.text.IDocumentListener, org.eclipse.jface.text.IDocumentExtension.IReplace)
     * @since 2.0
     */
    public void registerPostNotificationReplace(IDocumentListener owner, IDocumentExtension.IReplace replace) {
        if (fAcceptPostNotificationReplaces) {
            if (fPostNotificationChanges is null)
                fPostNotificationChanges= new ArrayList(1);
            fPostNotificationChanges.add(new RegisteredReplace(owner, replace));
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension#stopPostNotificationProcessing()
     * @since 2.0
     */
    public void stopPostNotificationProcessing() {
        ++ fStoppedCount;
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension#resumePostNotificationProcessing()
     * @since 2.0
     */
    public void resumePostNotificationProcessing() {
        -- fStoppedCount;
        if (fStoppedCount is 0 && fReentranceCount is 0)
            executePostNotificationChanges();
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension#startSequentialRewrite(bool)
     * @since 2.0
     */
    public void startSequentialRewrite(bool normalized) {
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension#stopSequentialRewrite()
     * @since 2.0
     */
    public void stopSequentialRewrite() {
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension2#resumeListenerNotification()
     * @since 2.1
     */
    public void resumeListenerNotification() {
        -- fStoppedListenerNotification;
        if (fStoppedListenerNotification is 0) {
            resumeDocumentListenerNotification();
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension2#stopListenerNotification()
     * @since 2.1
     */
    public void stopListenerNotification() {
        ++ fStoppedListenerNotification;
    }

    /**
     * Resumes the document listener notification by sending out the remembered
     * partition changed and document event.
     *
     * @since 2.1
     */
    private void resumeDocumentListenerNotification() {
        if (fDeferredDocumentEvent !is null) {
            DocumentEvent event= fDeferredDocumentEvent;
            fDeferredDocumentEvent= null;
            doFireDocumentChanged(event);
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension3#computeZeroLengthPartitioning(java.lang.String, int, int)
     * @since 3.0
     */
    public ITypedRegion[] computePartitioning(String partitioning, int offset, int length, bool includeZeroLengthPartitions)  {
        if ((0 > offset) || (0 > length) || (offset + length > getLength()))
            throw new BadLocationException();

        IDocumentPartitioner partitioner= getDocumentPartitioner(partitioning);

        if ( cast(IDocumentPartitionerExtension2)partitioner ) {
            checkStateOfPartitioner(partitioner, partitioning);
            return (cast(IDocumentPartitionerExtension2) partitioner).computePartitioning(offset, length, includeZeroLengthPartitions);
        } else if (partitioner !is null) {
            checkStateOfPartitioner(partitioner, partitioning);
            return partitioner.computePartitioning(offset, length);
        } else if (DEFAULT_PARTITIONING.equals(partitioning))
            return [ new TypedRegion(offset, length, DEFAULT_CONTENT_TYPE) ];
        else
            throw new BadPartitioningException();
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension3#getZeroLengthContentType(java.lang.String, int)
     * @since 3.0
     */
    public String getContentType(String partitioning, int offset, bool preferOpenPartitions)  {
        if ((0 > offset) || (offset > getLength()))
            throw new BadLocationException();

        IDocumentPartitioner partitioner= getDocumentPartitioner(partitioning);

        if ( cast(IDocumentPartitionerExtension2)partitioner ) {
            checkStateOfPartitioner(partitioner, partitioning);
            return (cast(IDocumentPartitionerExtension2) partitioner).getContentType(offset, preferOpenPartitions);
        } else if (partitioner !is null) {
            checkStateOfPartitioner(partitioner, partitioning);
            return partitioner.getContentType(offset);
        } else if (DEFAULT_PARTITIONING.equals(partitioning))
            return DEFAULT_CONTENT_TYPE;
        else
            throw new BadPartitioningException();
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension3#getDocumentPartitioner(java.lang.String)
     * @since 3.0
     */
    public IDocumentPartitioner getDocumentPartitioner(String partitioning)  {
        return fDocumentPartitioners !is null ? cast(IDocumentPartitioner) fDocumentPartitioners.get(partitioning) : null;
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension3#getLegalContentTypes(java.lang.String)
     * @since 3.0
     */
    public String[] getLegalContentTypes(String partitioning)  {
        IDocumentPartitioner partitioner= getDocumentPartitioner(partitioning);
        if (partitioner !is null)
            return partitioner.getLegalContentTypes();
        if (DEFAULT_PARTITIONING.equals(partitioning))
            return [ DEFAULT_CONTENT_TYPE ];
        throw new BadPartitioningException();
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension3#getZeroLengthPartition(java.lang.String, int)
     * @since 3.0
     */
    public ITypedRegion getPartition(String partitioning, int offset, bool preferOpenPartitions)  {
        if ((0 > offset) || (offset > getLength()))
            throw new BadLocationException();

        IDocumentPartitioner partitioner= getDocumentPartitioner(partitioning);

        if ( cast(IDocumentPartitionerExtension2)partitioner ) {
            checkStateOfPartitioner(partitioner, partitioning);
            return (cast(IDocumentPartitionerExtension2) partitioner).getPartition(offset, preferOpenPartitions);
        } else if (partitioner !is null) {
            checkStateOfPartitioner(partitioner, partitioning);
            return partitioner.getPartition(offset);
        } else if (DEFAULT_PARTITIONING.equals(partitioning))
            return new TypedRegion(0, getLength(), DEFAULT_CONTENT_TYPE);
        else
            throw new BadPartitioningException();
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension3#getPartitionings()
     * @since 3.0
     */
    public String[] getPartitionings() {
        if (fDocumentPartitioners is null)
            return new String[0];
        return stringcast(fDocumentPartitioners.keySet().toArray());
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension3#setDocumentPartitioner(java.lang.String, org.eclipse.jface.text.IDocumentPartitioner)
     * @since 3.0
     */
    public void setDocumentPartitioner(String partitioning, IDocumentPartitioner partitioner) {
        if (partitioner is null) {
            if (fDocumentPartitioners !is null) {
                fDocumentPartitioners.remove(partitioning);
                if (fDocumentPartitioners.size() is 0)
                    fDocumentPartitioners= null;
            }
        } else {
            if (fDocumentPartitioners is null)
                fDocumentPartitioners= new HashMap();
            fDocumentPartitioners.put(partitioning, cast(Object)partitioner);
        }
        DocumentPartitioningChangedEvent event= new DocumentPartitioningChangedEvent(this);
        event.setPartitionChange(partitioning, 0, getLength());
        fireDocumentPartitioningChanged(event);
    }

    /*
     * @see org.eclipse.jface.text.IRepairableDocument#repairLineInformation()
     * @since 3.0
     */
    public void repairLineInformation() {
        getTracker().set(get());
    }

    /**
     * Fires the given event to all registered rewrite session listeners. Uses robust iterators.
     *
     * @param event the event to be fired
     * @since 3.1
     */
    protected void fireRewriteSessionChanged(DocumentRewriteSessionEvent event) {
        if (fDocumentRewriteSessionListeners.size() > 0) {
            List list= new ArrayList(fDocumentRewriteSessionListeners);
            Iterator e= list.iterator();
            while (e.hasNext()) {
                IDocumentRewriteSessionListener l= cast(IDocumentRewriteSessionListener) e.next();
                l.documentRewriteSessionChanged(event);
            }
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#getActiveRewriteSession()
     */
    public final DocumentRewriteSession getActiveRewriteSession() {
        return fDocumentRewriteSession;
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#startRewriteSession(org.eclipse.jface.text.DocumentRewriteSessionType)
     * @since 3.1
     */
    public DocumentRewriteSession startRewriteSession(DocumentRewriteSessionType sessionType) {

        if (getActiveRewriteSession() !is null)
            throw new IllegalStateException();


        fDocumentRewriteSession= new DocumentRewriteSession(sessionType);
        if (DEBUG)
            System.out_.println(Format("AbstractDocument: Starting rewrite session: {}", fDocumentRewriteSession)); //$NON-NLS-1$

        fireRewriteSessionChanged(new DocumentRewriteSessionEvent(this, fDocumentRewriteSession, DocumentRewriteSessionEvent.SESSION_START));

        startRewriteSessionOnPartitioners(fDocumentRewriteSession);

        ILineTracker tracker= getTracker();
        if ( cast(ILineTrackerExtension)tracker ) {
            ILineTrackerExtension extension= cast(ILineTrackerExtension) tracker;
            extension.startRewriteSession(fDocumentRewriteSession);
        }

        if (DocumentRewriteSessionType.SEQUENTIAL is sessionType)
            startSequentialRewrite(false);
        else if (DocumentRewriteSessionType.STRICTLY_SEQUENTIAL is sessionType)
            startSequentialRewrite(true);

        return fDocumentRewriteSession;
    }

    /**
     * Starts the given rewrite session.
     *
     * @param session the rewrite session
     * @since 3.1
     */
    protected final void startRewriteSessionOnPartitioners(DocumentRewriteSession session) {
        if (fDocumentPartitioners !is null) {
            Iterator e= fDocumentPartitioners.values().iterator();
            while (e.hasNext()) {
                Object partitioner= e.next();
                if ( cast(IDocumentPartitionerExtension3)partitioner ) {
                    IDocumentPartitionerExtension3 extension= cast(IDocumentPartitionerExtension3) partitioner;
                    extension.startRewriteSession(session);
                }
            }
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#stopRewriteSession(org.eclipse.jface.text.DocumentRewriteSession)
     * @since 3.1
     */
    public void stopRewriteSession(DocumentRewriteSession session) {
        if (fDocumentRewriteSession is session) {

            if (DEBUG)
                System.out_.println(Format("AbstractDocument: Stopping rewrite session: {}", session)); //$NON-NLS-1$

            DocumentRewriteSessionType sessionType= session.getSessionType();
            if (DocumentRewriteSessionType.SEQUENTIAL is sessionType || DocumentRewriteSessionType.STRICTLY_SEQUENTIAL is sessionType)
                stopSequentialRewrite();

            ILineTracker tracker= getTracker();
            if ( cast(ILineTrackerExtension)tracker ) {
                ILineTrackerExtension extension= cast(ILineTrackerExtension) tracker;
                extension.stopRewriteSession(session, get());
            }

            stopRewriteSessionOnPartitioners(fDocumentRewriteSession);

            fDocumentRewriteSession= null;
            fireRewriteSessionChanged(new DocumentRewriteSessionEvent(this, session, DocumentRewriteSessionEvent.SESSION_STOP));
        }
    }

    /**
     * Stops the given rewrite session.
     *
     * @param session the rewrite session
     * @since 3.1
     */
    protected final void stopRewriteSessionOnPartitioners(DocumentRewriteSession session) {
        if (fDocumentPartitioners !is null) {
            DocumentPartitioningChangedEvent event= new DocumentPartitioningChangedEvent(this);
            Iterator e= fDocumentPartitioners.keySet().iterator();
            while (e.hasNext()) {
                String partitioning= stringcast( e.next());
                IDocumentPartitioner partitioner= cast(IDocumentPartitioner) fDocumentPartitioners.get(partitioning);
                if ( cast(IDocumentPartitionerExtension3)partitioner ) {
                    IDocumentPartitionerExtension3 extension= cast(IDocumentPartitionerExtension3) partitioner;
                    extension.stopRewriteSession(session);
                    event.setPartitionChange(partitioning, 0, getLength());
                }
            }
            if (!event.isEmpty())
                fireDocumentPartitioningChanged(event);
        }
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#addDocumentRewriteSessionListener(org.eclipse.jface.text.IDocumentRewriteSessionListener)
     * @since 3.1
     */
    public void addDocumentRewriteSessionListener(IDocumentRewriteSessionListener listener) {
        Assert.isNotNull(cast(Object)listener);
        if (! fDocumentRewriteSessionListeners.contains(cast(Object)listener))
            fDocumentRewriteSessionListeners.add(cast(Object)listener);
    }

    /*
     * @see org.eclipse.jface.text.IDocumentExtension4#removeDocumentRewriteSessionListener(org.eclipse.jface.text.IDocumentRewriteSessionListener)
     * @since 3.1
     */
    public void removeDocumentRewriteSessionListener(IDocumentRewriteSessionListener listener) {
        Assert.isNotNull(cast(Object)listener);
        fDocumentRewriteSessionListeners.remove(cast(Object)listener);
    }

    /**
     * Checks the state for the given partitioner and stops the
     * active rewrite session.
     *
     * @param partitioner the document partitioner to be checked
     * @param partitioning the document partitioning the partitioner is registered for
     * @since 3.1
     */
    protected final void checkStateOfPartitioner(IDocumentPartitioner partitioner, String partitioning) {
        if (!( cast(IDocumentPartitionerExtension3)partitioner ))
            return;

        IDocumentPartitionerExtension3 extension= cast(IDocumentPartitionerExtension3) partitioner;
        DocumentRewriteSession session= extension.getActiveRewriteSession();
        if (session !is null) {
            extension.stopRewriteSession(session);

            if (DEBUG)
                System.out_.println(Format("AbstractDocument: Flushing rewrite session for partition type: {}", partitioning)); //$NON-NLS-1$

            DocumentPartitioningChangedEvent event= new DocumentPartitioningChangedEvent(this);
            event.setPartitionChange(partitioning, 0, getLength());
            fireDocumentPartitioningChanged(event);
        }
    }

    /**
     * Returns all positions of the given category that are inside the given region.
     *
     * @param category the position category
     * @param offset the start position of the region, must be >= 0
     * @param length the length of the region, must be >= 0
     * @param canStartBefore if <code>true</code> then positions are included
     *            which start before the region if they end at or after the regions start
     * @param canEndAfter if <code>true</code> then positions are included
     *            which end after the region if they start at or before the regions end
     * @return all positions inside the region of the given category
     * @throws BadPositionCategoryException if category is undefined in this document
     * @since 3.4
     */
    public Position[] getPositions(String category, int offset, int length, bool canStartBefore, bool canEndAfter)  {
        if (canStartBefore && canEndAfter || (!canStartBefore && !canEndAfter)) {
            List documentPositions;
            if (canStartBefore && canEndAfter) {
                if (offset < getLength() / 2) {
                    documentPositions= getStartingPositions(category, 0, offset + length);
                } else {
                    documentPositions= getEndingPositions(category, offset, getLength() - offset + 1);
                }
            } else {
                documentPositions= getStartingPositions(category, offset, length);
            }

            ArrayList list= new ArrayList(documentPositions.size());

            Position region= new Position(offset, length);

            for (Iterator iterator= documentPositions.iterator(); iterator.hasNext();) {
                Position position= cast(Position) iterator.next();
                if (isWithinRegion(region, position, canStartBefore, canEndAfter)) {
                    list.add(position);
                }
            }

            Position[] positions= new Position[list.size()];
            list.toArray(positions);
            return positions;
        } else if (canStartBefore) {
            List list= getEndingPositions(category, offset, length);
            Position[] positions= new Position[list.size()];
            list.toArray(positions);
            return positions;
        } else {
            Assert.isLegal(canEndAfter && !canStartBefore);

            List list= getStartingPositions(category, offset, length);
            Position[] positions= new Position[list.size()];
            list.toArray(positions);
            return positions;
        }
    }

    /*
     * @since 3.4
     */
    private bool isWithinRegion(Position region, Position position, bool canStartBefore, bool canEndAfter) {
        if (canStartBefore && canEndAfter) {
            return region.overlapsWith(position.getOffset(), position.getLength());
        } else if (canStartBefore) {
            return region.includes(position.getOffset() + position.getLength() - 1);
        } else if (canEndAfter) {
            return region.includes(position.getOffset());
        } else {
            int start= position.getOffset();
            return region.includes(start) && region.includes(start + position.getLength() - 1);
        }
    }

    /**
     * A list of positions in the given category with an offset inside the given
     * region. The order of the positions is arbitrary.
     *
     * @param category the position category
     * @param offset the offset of the region
     * @param length the length of the region
     * @return a list of the positions in the region
     * @throws BadPositionCategoryException if category is undefined in this document
     * @since 3.4
     */
    private List getStartingPositions(String category, int offset, int length)  {
        List positions= cast(List) fPositions.get(category);
        if (positions is null)
            throw new BadPositionCategoryException();

        int indexStart= computeIndexInPositionList(positions, offset, true);
        int indexEnd= computeIndexInPositionList(positions, offset + length, true);

        return positions.subList(indexStart, indexEnd);
    }

    /**
     * A list of positions in the given category with an end position inside
     * the given region. The order of the positions is arbitrary.
     *
     * @param category the position category
     * @param offset the offset of the region
     * @param length the length of the region
     * @return a list of the positions in the region
     * @throws BadPositionCategoryException if category is undefined in this document
     * @since 3.4
     */
    private List getEndingPositions(String category, int offset, int length)  {
        List positions= cast(List) fEndPositions.get(category);
        if (positions is null)
            throw new BadPositionCategoryException();

        int indexStart= computeIndexInPositionList(positions, offset, false);
        int indexEnd= computeIndexInPositionList(positions, offset + length, false);

        return positions.subList(indexStart, indexEnd);
    }


}
