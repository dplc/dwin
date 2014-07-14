/*******************************************************************************
 * Copyright (c) 2000, 2006 IBM Corporation and others.
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
module org.eclipse.jface.action.SubContributionManager;

import org.eclipse.jface.action.IContributionManager;
import org.eclipse.jface.action.ActionContributionItem;
import org.eclipse.jface.action.IAction;
import org.eclipse.jface.action.SubContributionItem;
import org.eclipse.jface.action.IContributionItem;
import org.eclipse.jface.action.IContributionManagerOverrides;


import java.lang.all;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;

/**
 * A <code>SubContributionManager</code> is used to define a set of contribution
 * items within a parent manager.  Once defined, the visibility of the entire set can
 * be changed as a unit.
 */
public abstract class SubContributionManager : IContributionManager {
    /**
     * The parent contribution manager.
     */
    private IContributionManager parentMgr;

    /**
     * Maps each item in the manager to a wrapper.  The wrapper is used to
     * control the visibility of each item.
     */
    private Map mapItemToWrapper;

    /**
     * The visibility of the manager,
     */
    private bool visible = false;

    /**
     * Constructs a new <code>SubContributionManager</code>
     *
     * @param mgr the parent contribution manager.  All contributions made to the
     *      <code>SubContributionManager</code> are forwarded and appear in the
     *      parent manager.
     */
    public this(IContributionManager mgr) {
        mapItemToWrapper = new HashMap();
        //super();
        parentMgr = mgr;
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void add(IAction action) {
        add(new ActionContributionItem(action));
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void add(IContributionItem item) {
        item.setParent(this);
        SubContributionItem wrap = wrap(item);
        wrap.setVisible(visible);
        parentMgr.add(wrap);
        itemAdded(item, wrap);
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void appendToGroup(String groupName, IAction action) {
        appendToGroup(groupName, new ActionContributionItem(action));
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void appendToGroup(String groupName, IContributionItem item) {
        item.setParent(this);
        SubContributionItem wrap = wrap(item);
        wrap.setVisible(visible);
        parentMgr.appendToGroup(groupName, wrap);
        itemAdded(item, wrap);
    }

    /**
     * Disposes this sub contribution manager, removing all its items
     * and cleaning up any other resources allocated by it.
     * This must leave no trace of this sub contribution manager
     * in the parent manager.  Subclasses may extend.
     *
     * @since 3.0
     */
    public void disposeManager() {
        Iterator it = mapItemToWrapper.values().iterator();
        // Dispose items in addition to removing them.
        // See bugs 64024 and 73715 for details.
        // Do not use getItems() here as subclasses can override that in bad ways.
        while (it.hasNext()) {
            IContributionItem item = cast(IContributionItem) it.next();
            item.dispose();
        }
        removeAll();
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     *
     * Returns the item passed to us, not the wrapper.
     */
    public IContributionItem find(String id) {
        IContributionItem item = parentMgr.find(id);
        // Return the item passed to us, not the wrapper.
        item = unwrap(item);
        return item;
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     *
     * Returns the items passed to us, not the wrappers.
     */
    public IContributionItem[] getItems() {
        IContributionItem[] result = arraycast!(IContributionItem)(mapItemToWrapper.keySet().toArray());
        return result;
    }

    /**
     * Returns the parent manager.
     *
     * @return the parent manager
     */
    public IContributionManager getParent() {
        return parentMgr;
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public IContributionManagerOverrides getOverrides() {
        return parentMgr.getOverrides();
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void insertAfter(String id, IAction action) {
        insertAfter(id, new ActionContributionItem(action));
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void insertAfter(String id, IContributionItem item) {
        item.setParent(this);
        SubContributionItem wrap = wrap(item);
        wrap.setVisible(visible);
        parentMgr.insertAfter(id, wrap);
        itemAdded(item, wrap);
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void insertBefore(String id, IAction action) {
        insertBefore(id, new ActionContributionItem(action));
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void insertBefore(String id, IContributionItem item) {
        item.setParent(this);
        SubContributionItem wrap = wrap(item);
        wrap.setVisible(visible);
        parentMgr.insertBefore(id, wrap);
        itemAdded(item, wrap);
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public bool isDirty() {
        return parentMgr.isDirty();
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public bool isEmpty() {
        return parentMgr.isEmpty();
    }

    /**
     * Returns whether the contribution list is visible.
     * If the visibility is <code>true</code> then each item within the manager
     * appears within the parent manager.  Otherwise, the items are not visible.
     *
     * @return <code>true</code> if the manager is visible
     */
    public bool isVisible() {
        return visible;
    }

    /**
     * Notifies that an item has been added.
     * <p>
     * Subclasses are not expected to override this method.
     * </p>
     *
     * @param item the item contributed by the client
     * @param wrap the item contributed to the parent manager as a proxy for the item
     *      contributed by the client
     */
    protected void itemAdded(IContributionItem item, SubContributionItem wrap) {
        mapItemToWrapper.put(cast(Object)item, wrap);
    }

    /**
     * Notifies that an item has been removed.
     * <p>
     * Subclasses are not expected to override this method.
     * </p>
     *
     * @param item the item contributed by the client
     */
    protected void itemRemoved(IContributionItem item) {
        mapItemToWrapper.remove(cast(Object)item);
    }

    /**
     * @return fetch all enumeration of wrappers for the item
     * @deprecated Use getItems(String value) instead.
     */
    public Enumeration items() {
        return new class(mapItemToWrapper.values().iterator()) Enumeration {
            Iterator i;
            this(Iterator i_){
                i = i_;
            }
            public bool hasMoreElements() {
                return i.hasNext();
            }

            public Object nextElement() {
                return i.next();
            }
        };
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void markDirty() {
        parentMgr.markDirty();
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void prependToGroup(String groupName, IAction action) {
        prependToGroup(groupName, new ActionContributionItem(action));
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void prependToGroup(String groupName, IContributionItem item) {
        item.setParent(this);
        SubContributionItem wrap = wrap(item);
        wrap.setVisible(visible);
        parentMgr.prependToGroup(groupName, wrap);
        itemAdded(item, wrap);
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public IContributionItem remove(String id) {
        IContributionItem result = parentMgr.remove(id);
        if (result !is null) {
            itemRemoved(result);
        }
        return result;
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public IContributionItem remove(IContributionItem item) {
        SubContributionItem wrap = cast(SubContributionItem) mapItemToWrapper
                .get(cast(Object)item);
        if (wrap is null) {
            return null;
        }
        IContributionItem result = parentMgr.remove(wrap);
        if (result is null) {
            return null;
        }
        itemRemoved(item);
        return item;
    }

    /* (non-Javadoc)
     * Method declared on IContributionManager.
     */
    public void removeAll() {
        Iterator it = mapItemToWrapper.values().iterator();
        while (it.hasNext()) {
            IContributionItem item = cast(IContributionItem) it.next();
            parentMgr.remove(item);
        }
        mapItemToWrapper.clear();
    }

    /**
     * Sets the visibility of the manager.  If the visibility is <code>true</code>
     * then each item within the manager appears within the parent manager.
     * Otherwise, the items are not visible.
     *
     * @param visible the new visibility
     */
    public void setVisible(bool visible) {
        this.visible = visible;
        if (mapItemToWrapper.size() > 0) {
            Iterator it = mapItemToWrapper.values().iterator();
            while (it.hasNext()) {
                IContributionItem item = cast(IContributionItem) it.next();
                item.setVisible(visible);
            }
            parentMgr.markDirty();
        }
    }

    /**
     * Wraps a contribution item in a sub contribution item, and returns the new wrapper.
     * @param item the contribution item to be wrapped
     * @return the wrapped item
     */
    protected SubContributionItem wrap(IContributionItem item) {
        return new SubContributionItem(item);
    }

    /**
     * Unwraps a nested contribution item. If the contribution item is an
     * instance of <code>SubContributionItem</code>, then its inner item is
     * returned. Otherwise, the item itself is returned.
     *
     * @param item
     *            The item to unwrap; may be <code>null</code>.
     * @return The inner item of <code>item</code>, if <code>item</code> is
     *         a <code>SubContributionItem</code>;<code>item</code>
     *         otherwise.
     */
    protected IContributionItem unwrap(IContributionItem item) {
        if (cast(SubContributionItem)item ) {
            return (cast(SubContributionItem) item).getInnerItem();
        }

        return item;
    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
