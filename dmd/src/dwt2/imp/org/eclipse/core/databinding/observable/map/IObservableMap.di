/*******************************************************************************
 * Copyright (c) 2006, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Brad Reynolds - bug 164653
 *******************************************************************************/

module org.eclipse.core.databinding.observable.map.IObservableMap;
import org.eclipse.core.databinding.observable.map.IMapChangeListener;

import java.lang.all;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

import org.eclipse.core.databinding.observable.IObservable;

/**
 * Observable Map.
 * 
 * @noextend This interface is not intended to be extended by clients.
 * @noimplement This interface is not intended to be implemented by clients.
 *              Clients should instead subclass one of the classes that
 *              implement this interface. Note that direct implementers of this
 *              interface outside of the framework will be broken in future
 *              releases when methods are added to this interface.
 *              
 * @see AbstractObservableMap
 * @see ObservableMap
 * 
 * @since 1.1
 */
public interface IObservableMap : Map, IObservable {
    
    /**
     * @param listener
     */
    public void addMapChangeListener(IMapChangeListener listener);

    /**
     * @param listener
     */
    public void removeMapChangeListener(IMapChangeListener listener);
    
    /**
     * @TrackedGetter
     */
    public int size();

    /**
     * @TrackedGetter
     */
    public bool isEmpty();

    /**
     * @TrackedGetter
     */
    public bool containsKey(Object key);

    /**
     * @TrackedGetter
     */
    public bool containsValue(Object value);

    /**
     * @TrackedGetter
     */
    public Object get(Object key);

    /**
     * 
     */
    public Object put(Object key, Object value);

    /**
     * 
     */
    public Object remove(Object key);

    /**
     * @TrackedGetter
     */
    public Set keySet();

    /**
     * @TrackedGetter
     */
    public Collection values();

    /**
     * @TrackedGetter
     */
    public Set entrySet();

    /**
     * @TrackedGetter
     */
    public equals_t opEquals(Object o);

    /**
     * @TrackedGetter
     */
    public hash_t toHash();
}

version (build) {
    debug {
        pragma(link, "dwt2coredatabinding");
    } else {
        pragma(link, "dwt2coredatabinding");
    }
}
