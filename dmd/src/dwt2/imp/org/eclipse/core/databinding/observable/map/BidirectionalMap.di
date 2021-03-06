/*******************************************************************************
 * Copyright (c) 2006, 2007 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *******************************************************************************/
module org.eclipse.core.databinding.observable.map.BidirectionalMap;
import org.eclipse.core.databinding.observable.map.MapDiff;
import org.eclipse.core.databinding.observable.map.ObservableMap;
import org.eclipse.core.databinding.observable.map.MapChangeEvent;
import org.eclipse.core.databinding.observable.map.IMapChangeListener;
import org.eclipse.core.databinding.observable.map.IObservableMap;

import java.lang.all;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.eclipse.core.databinding.observable.Realm;

/**
 * 
 * <p>
 * This class is thread safe. All state accessing methods must be invoked from
 * the {@link Realm#isCurrent() current realm}. Methods for adding and removing
 * listeners may be invoked from any thread.
 * </p>
 * @since 1.0
 * 
 */
public class BidirectionalMap : ObservableMap {

    private Map valueToElements;

    private IMapChangeListener mapListener;
    class MapListener : IMapChangeListener {

        public void handleMapChange(MapChangeEvent event) {
            MapDiff diff = event.diff;
            for (Iterator it = diff.getAddedKeys().iterator(); it.hasNext();) {
                Object addedKey = it.next();
                addMapping(addedKey, diff.getNewValue(addedKey));
            }
            for (Iterator it = diff.getChangedKeys().iterator(); it.hasNext();) {
                Object changedKey = it.next();
                removeMapping(changedKey, diff.getOldValue(changedKey));
                addMapping(changedKey, diff.getNewValue(changedKey));
            }
            for (Iterator it = diff.getRemovedKeys().iterator(); it.hasNext();) {
                Object removedKey = it.next();
                removeMapping(removedKey, diff.getOldValue(removedKey));
            }
            fireMapChange(diff);
        }
    };

    /**
     * @param wrappedMap
     */
    public this(IObservableMap wrappedMap) {
valueToElements = new HashMap();
mapListener = new MapListener();
        super(wrappedMap.getRealm(), wrappedMap);
        wrappedMap.addMapChangeListener(mapListener);
        for (Iterator it = wrappedMap.entrySet().iterator(); it.hasNext();) {
            Map.Entry entry = cast(Entry) it.next();
            addMapping(entry.getKey(), entry.getValue());
        }
    }

    /**
     * @param key
     * @param value
     */
    private void addMapping(Object key, Object value) {
        Object elementOrSet = valueToElements.get(value);
        if (elementOrSet is null) {
            valueToElements.put(value, key);
            return;
        }
        if (!( null !is cast(Set)elementOrSet )) {
            elementOrSet = new HashSet(Collections.singleton(elementOrSet));
            valueToElements.put(value, elementOrSet);
        }
        Set set = cast(Set) elementOrSet;
        set.add(key);
    }

    /**
     * @param functionValue
     * @param element
     */
    private void removeMapping(Object functionValue, Object element) {
        Object elementOrSet = valueToElements.get(functionValue);
        if ( null !is cast(Set)elementOrSet ) {
            Set set = cast(Set) elementOrSet;
            set.remove(element);
            if (set.size() is 0) {
                valueToElements.remove(functionValue);
            }
        } else {
            valueToElements.remove(functionValue);
        }
    }

}

version (build) {
    debug {
        pragma(link, "dwt2coredatabinding");
    } else {
        pragma(link, "dwt2coredatabinding");
    }
}
