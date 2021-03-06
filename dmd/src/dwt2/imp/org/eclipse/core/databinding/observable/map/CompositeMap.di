/*******************************************************************************
 * Copyright (c) 2006, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *******************************************************************************/
module org.eclipse.core.databinding.observable.map.CompositeMap;
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

import org.eclipse.core.databinding.observable.Diffs;
import org.eclipse.core.databinding.observable.Realm;
import org.eclipse.core.databinding.observable.masterdetail.IObservableFactory;
import org.eclipse.core.databinding.observable.set.WritableSet;
import org.eclipse.core.runtime.Assert;

/**
 * A read-only observable map formed by the composition of two observable maps.
 * If map1 maps keys a:A to values b1:B, and map2 maps keys b2:B to values c:C,
 * the composite map maps keys a:A to values c:C. For example, map1 could map
 * Order objects to their corresponding Customer objects, and map2 could map
 * Customer objects to their "last name" property of type String. The composite
 * map of map1 and map2 would then map Order objects to their customers' last
 * names.
 * 
 * <p>
 * This class is thread safe. All state accessing methods must be invoked from
 * the {@link Realm#isCurrent() current realm}. Methods for adding and removing
 * listeners may be invoked from any thread.
 * </p>
 * 
 * @since 1.1
 * 
 */
public class CompositeMap : ObservableMap {

    private Map valueToElements;

    // adds that need to go through the second map and thus will be picked up by
    // secondMapListener.
    private Set pendingAdds;

    // Removes that need to go through the second map and thus will be picked up
    // by
    // secondMapListener. Maps from value being removed to key being removed.
    private Map pendingRemoves;

    // Changes that need to go through the second map and thus will be picked up
    // by
    // secondMapListener. Maps from old value to new value and new value to old
    // value.
    private Map pendingChanges;

    private IMapChangeListener firstMapListener;
    class FirstMapListener : IMapChangeListener {

        public void handleMapChange(MapChangeEvent event) {
            MapDiff diff = event.diff;
            Set rangeSetAdditions = new HashSet();
            Set rangeSetRemovals = new HashSet();
            final Set adds = new HashSet();
            final Set changes = new HashSet();
            final Set removes = new HashSet();
            final Map oldValues = new HashMap();

            for (Iterator it = diff.getAddedKeys().iterator(); it.hasNext();) {
                Object addedKey = it.next();
                Object newValue = diff.getNewValue(addedKey);
                addMapping(addedKey, newValue);
                if (!rangeSet.contains(newValue)) {
                    pendingAdds.add(newValue);
                    rangeSetAdditions.add(newValue);
                } else {
                    adds.add(addedKey);
                    wrappedMap.put(addedKey, secondMap.get(newValue));
                }
            }
            for (Iterator it = diff.getChangedKeys().iterator(); it.hasNext();) {
                Object changedKey = it.next();
                Object oldValue = diff.getOldValue(changedKey);
                Object newValue = diff.getNewValue(changedKey);
                bool removed = removeMapping(changedKey, oldValue);
                addMapping(changedKey, newValue);
                bool added = !rangeSet.contains(newValue);
                if (removed) {
                    pendingRemoves.put(oldValue, changedKey);
                    rangeSetRemovals.add(oldValue);
                }
                if (added) {
                    pendingAdds.add(newValue);
                    rangeSetAdditions.add(newValue);
                }
                if (added || removed) {
                    pendingChanges.put(oldValue, newValue);
                    pendingChanges.put(newValue, oldValue);
                } else {
                    changes.add(changedKey);
                    oldValues.put(changedKey, oldValue);
                    wrappedMap.put(changedKey, secondMap.get(newValue));
                }
            }
            for (Iterator it = diff.getRemovedKeys().iterator(); it.hasNext();) {
                Object removedKey = it.next();
                Object oldValue = diff.getOldValue(removedKey);
                if (removeMapping(removedKey, oldValue)) {
                    pendingRemoves.put(oldValue, removedKey);
                    rangeSetRemovals.add(oldValue);
                } else {
                    removes.add(removedKey);
                    oldValues.put(removedKey, secondMap.get(oldValue));
                    wrappedMap.remove(removedKey);
                }
            }

            if (adds.size() > 0 || removes.size() > 0 || changes.size() > 0) {
                fireMapChange(new class() MapDiff {

                    public Set getAddedKeys() {
                        return adds;
                    }

                    public Set getChangedKeys() {
                        return changes;
                    }

                    public Object getNewValue(Object key) {
                        return wrappedMap.get(key);
                    }

                    public Object getOldValue(Object key) {
                        return oldValues.get(key);
                    }

                    public Set getRemovedKeys() {
                        return removes;
                    }
                });
            }

            if (rangeSetAdditions.size() > 0 || rangeSetRemovals.size() > 0) {
                rangeSet.addAndRemove(rangeSetAdditions, rangeSetRemovals);
            }
        }
    };

    private IMapChangeListener secondMapListener;
    class SecondMapListener : IMapChangeListener {

        public void handleMapChange(MapChangeEvent event) {
            MapDiff diff = event.diff;
            final Set adds = new HashSet();
            final Set changes = new HashSet();
            final Set removes = new HashSet();
            final Map oldValues = new HashMap();
            final Map newValues = new HashMap();
            Set addedKeys = new HashSet(diff.getAddedKeys());
            Set removedKeys = new HashSet(diff.getRemovedKeys());

            for (Iterator it = addedKeys.iterator(); it.hasNext();) {
                Object addedKey = it.next();
                Set elements = getElementsForValue(addedKey);
                Object newValue = diff.getNewValue(addedKey);
                if (pendingChanges.containsKey(addedKey)) {
                    Object oldKey = pendingChanges.remove(addedKey);
                    Object oldValue;
                    if (removedKeys.remove(oldKey)) {
                        oldValue = diff.getOldValue(oldKey);
                    } else {
                        oldValue = secondMap.get(oldKey);
                    }
                    pendingChanges.remove(oldKey);
                    pendingAdds.remove(addedKey);
                    pendingRemoves.remove(oldKey);
                    for (Iterator it2 = elements.iterator(); it2.hasNext();) {
                        Object element = it2.next();
                        changes.add(element);
                        oldValues.put(element, oldValue);
                        newValues.put(element, newValue);
                        wrappedMap.put(element, newValue);
                    }
                } else if (pendingAdds.remove(addedKey)) {
                    for (Iterator it2 = elements.iterator(); it2.hasNext();) {
                        Object element = it2.next();
                        adds.add(element);
                        newValues.put(element, newValue);
                        wrappedMap.put(element, newValue);
                    }
                } else {
                    Assert.isTrue(false, "unexpected case"); //$NON-NLS-1$
                }
            }
            for (Iterator it = diff.getChangedKeys().iterator(); it.hasNext();) {
                Object changedKey = it.next();
                Set elements = getElementsForValue(changedKey);
                for (Iterator it2 = elements.iterator(); it2.hasNext();) {
                    Object element = it2.next();
                    changes.add(element);
                    oldValues.put(element, diff.getOldValue(changedKey));
                    Object newValue = diff.getNewValue(changedKey);
                    newValues.put(element, newValue);
                    wrappedMap.put(element, newValue);
                }
            }
            for (Iterator it = removedKeys.iterator(); it.hasNext();) {
                Object removedKey = it.next();
                Object element = pendingRemoves.remove(removedKey);
                if (element !is null) {
                    if (pendingChanges.containsKey(removedKey)) {
                        Object newKey = pendingChanges.remove(removedKey);
                        pendingChanges.remove(newKey);
                        pendingAdds.remove(newKey);
                        pendingRemoves.remove(removedKey);
                        changes.add(element);
                        oldValues.put(element, diff.getOldValue(removedKey));
                        Object newValue = secondMap.get(newKey);
                        newValues.put(element, newValue);
                        wrappedMap.put(element, newValue);
                    } else {
                        removes.add(element);
                        Object oldValue = diff.getOldValue(removedKey);
                        oldValues.put(element, oldValue);
                        wrappedMap.remove(element);
                    }
                } else {
                    Assert.isTrue(false, "unexpected case"); //$NON-NLS-1$
                }
            }

            if (adds.size() > 0 || removes.size() > 0 || changes.size() > 0) {
                fireMapChange(new class() MapDiff {

                    public Set getAddedKeys() {
                        return adds;
                    }

                    public Set getChangedKeys() {
                        return changes;
                    }

                    public Object getNewValue(Object key) {
                        return newValues.get(key);
                    }

                    public Object getOldValue(Object key) {
                        return oldValues.get(key);
                    }

                    public Set getRemovedKeys() {
                        return removes;
                    }
                });
            }
        }
    };

    private IObservableMap firstMap;
    private IObservableMap secondMap;

    private static class WritableSetPlus : WritableSet {
        void addAndRemove(Set additions, Set removals) {
            wrappedSet.removeAll(removals);
            wrappedSet.addAll(additions);
            fireSetChange(Diffs.createSetDiff(additions, removals));
        }
    }

    private WritableSetPlus rangeSet;

    /**
     * Creates a new composite map. Because the key set of the second map is
     * determined by the value set of the given observable map
     * <code>firstMap</code>, it cannot be passed in as an argument. Instead,
     * the second map will be created by calling
     * <code>secondMapFactory.createObservable(valueSet())</code>.
     * 
     * @param firstMap
     *            the first map
     * @param secondMapFactory
     *            a factory that creates the second map when given an observable
     *            set representing the value set of <code>firstMap</code>.
     */
    public this(IObservableMap firstMap,
            IObservableFactory secondMapFactory) {
valueToElements = new HashMap();
pendingAdds = new HashSet();
pendingRemoves = new HashMap();
pendingChanges = new HashMap();
firstMapListener = new FirstMapListener();
secondMapListener = new SecondMapListener();
rangeSet = new WritableSetPlus();
        super(firstMap.getRealm(), new HashMap());
        this.firstMap = firstMap;
        firstMap.addMapChangeListener(firstMapListener);
        for (Iterator it = firstMap.entrySet().iterator(); it.hasNext();) {
            Map.Entry entry = cast(Entry) it.next();
            addMapping(entry.getKey(), entry.getValue());
            rangeSet.add(entry.getValue());
        }
        this.secondMap = cast(IObservableMap) secondMapFactory
                .createObservable(rangeSet);
        secondMap.addMapChangeListener(secondMapListener);
        for (Iterator it = firstMap.entrySet().iterator(); it.hasNext();) {
            Map.Entry entry = cast(Entry) it.next();
            wrappedMap.put(entry.getKey(), secondMap.get(entry.getValue()));
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
     * @param key
     * @param value
     */
    private bool removeMapping(Object key, Object value) {
        Object elementOrSet = valueToElements.get(value);
        if ( null !is cast(Set)elementOrSet ) {
            Set set = cast(Set) elementOrSet;
            set.remove(key);
            if (set.size() is 0) {
                valueToElements.remove(value);
                return true;
            }
            return false;
        }
        valueToElements.remove(value);
        return true;
    }

    private Set getElementsForValue(Object value) {
        Object elementOrSet = valueToElements.get(value);
        if ( null !is cast(Set)elementOrSet ) {
            return cast(Set) elementOrSet;
        }
        return elementOrSet is null ? Collections.EMPTY_SET : Collections
                .singleton(elementOrSet);
    }

    public synchronized void dispose() {
        super.dispose();
        firstMap.removeMapChangeListener(firstMapListener);
        firstMap = null;
        secondMap = null;
    }

}

version (build) {
    debug {
        pragma(link, "dwt2coredatabinding");
    } else {
        pragma(link, "dwt2coredatabinding");
    }
}
