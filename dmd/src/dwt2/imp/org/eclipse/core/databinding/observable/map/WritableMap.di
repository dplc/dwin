/*******************************************************************************
 * Copyright (c) 2006-2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Brad Reynolds - bug 164653
 *     Matthew Hall - bug 184830
 *******************************************************************************/

module org.eclipse.core.databinding.observable.map.WritableMap;
import org.eclipse.core.databinding.observable.map.ObservableMap;

import java.lang.all;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.eclipse.core.databinding.observable.Diffs;
import org.eclipse.core.databinding.observable.Realm;
import org.eclipse.core.internal.databinding.Util;

/**
 * 
 * <p>
 * This class is thread safe. All state accessing methods must be invoked from
 * the {@link Realm#isCurrent() current realm}. Methods for adding and removing
 * listeners may be invoked from any thread.
 * </p>
 * @since 1.0
 */
public class WritableMap : ObservableMap {

    /**
     * Constructs a new WritableMap on the default realm.
     */
    public this() {
        this(Realm.getDefault());
    }
    
    /**
     * Constructs a new WritableMap on the given realm.
     * 
     * @param realm
     *            the realm
     */
    public this(Realm realm) {
        super(realm, new HashMap());
    }

    /**
     * Associates the provided <code>value</code> with the <code>key</code>.  Must be invoked from the current realm.
     */
    public Object put(Object key, Object value) {
        checkRealm();
        Object result = wrappedMap.put(key, value);
        if (!Util.equals(result, value)) {
            if (result is null) {
                fireMapChange(Diffs.createMapDiffSingleAdd(key, value));
            } else {
                fireMapChange(Diffs.createMapDiffSingleChange(key, result,
                        value));
            }
        }
        return result;
    }

    /**
     * Removes the value with the provide <code>key</code>.  Must be invoked from the current realm.
     */
    public Object remove(Object key) {
        checkRealm();
        Object result = wrappedMap.remove(key);
        if (result !is null) {
            fireMapChange(Diffs.createMapDiffSingleRemove(key, result));
        }
        return result;
    }

    /**
     * Clears the map.  Must be invoked from the current realm.
     */
    public void clear() {
        checkRealm();
        if (!isEmpty()) {
            Map copy = new HashMap(wrappedMap);
            wrappedMap.clear();
            fireMapChange(Diffs.createMapDiffRemoveAll(copy));
        }
    }

    /**
     * Adds the provided <code>map</code>'s contents to this map.  Must be invoked from the current realm.
     */
    public void putAll(Map map) {
        checkRealm();
        Set addedKeys = new HashSet(map.size());
        Map changes = new HashMap(map.size());
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            Map.Entry entry = cast(Entry) it.next();
            Object previousValue = wrappedMap.put(entry.getKey(), entry.getValue());
            if (previousValue is null) {
                addedKeys.add(entry.getKey());
            } else {
                changes.put(entry.getKey(), previousValue);
            }
        }
        if (!addedKeys.isEmpty() || !changes.isEmpty()) {
            fireMapChange(Diffs.createMapDiff(addedKeys, Collections.EMPTY_SET, changes.keySet(), changes, wrappedMap));
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
