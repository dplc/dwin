/*******************************************************************************
 * Copyright (c) 2006, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Matthew Hall - bug 208332
 *******************************************************************************/

module org.eclipse.core.internal.databinding.observable.ProxyObservableSet;

import java.lang.all;

import java.util.Collections;
import java.util.Set;

import org.eclipse.core.databinding.observable.IStaleListener;
import org.eclipse.core.databinding.observable.StaleEvent;
import org.eclipse.core.databinding.observable.set.AbstractObservableSet;
import org.eclipse.core.databinding.observable.set.IObservableSet;
import org.eclipse.core.databinding.observable.set.ISetChangeListener;
import org.eclipse.core.databinding.observable.set.SetChangeEvent;

/**
 * Wraps an observable set. This object acts like an exact copy of the original
 * set, and tracks all the changes in the original. The only difference is that
 * disposing the wrapper will not dispose the original. You can use this
 * whenever you need to return an IObservableSet from a method that expects the
 * caller to dispose the set, but you have an IObservableSet that you don't want
 * disposed.
 */
public class ProxyObservableSet : AbstractObservableSet {
    private IObservableSet wrappedSet;
    private Object elementType;

    private ISetChangeListener setChangeListener;
    class SetChangeListener : ISetChangeListener {
        public void handleSetChange(SetChangeEvent event) {
            fireSetChange(event.diff);
        }
    };

    private IStaleListener staleListener;
    class StaleListener : IStaleListener {
        public void handleStale(StaleEvent staleEvent) {
            fireStale();
        }
    };

    /**
     * Constructs a ProxyObservableSet that tracks the state of the given set.
     * 
     * @param wrappedSet
     *            the set being wrapped
     */
    public this(IObservableSet wrappedSet) {
setChangeListener = new SetChangeListener();
staleListener = new StaleListener();
        super(wrappedSet.getRealm());
        this.wrappedSet = wrappedSet;
        this.elementType = wrappedSet.getElementType();
        wrappedSet.addSetChangeListener(setChangeListener);
        wrappedSet.addStaleListener(staleListener);
    }

    protected Set getWrappedSet() {
        return wrappedSet is null ? Collections.EMPTY_SET : wrappedSet;
    }

    public Object getElementType() {
        return elementType;
    }

    public bool isStale() {
        getterCalled();
        return wrappedSet is null ? false : wrappedSet.isStale();
    }

    public void dispose() {
        if (wrappedSet !is null) {
            wrappedSet.removeSetChangeListener(setChangeListener);
            setChangeListener = null;
            wrappedSet.removeStaleListener(staleListener);
            staleListener = null;
            wrappedSet = null;
        }
        elementType = null;
        super.dispose();
    }
}
