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
 *     Matthew Hall - bug 118516
 *******************************************************************************/

module org.eclipse.core.databinding.observable.AbstractObservable;
import org.eclipse.core.databinding.observable.IChangeListener;
import org.eclipse.core.databinding.observable.ChangeEvent;
import org.eclipse.core.databinding.observable.Realm;
import org.eclipse.core.databinding.observable.IStaleListener;
import org.eclipse.core.databinding.observable.IObservable;
import org.eclipse.core.databinding.observable.StaleEvent;
import org.eclipse.core.databinding.observable.ChangeManager;

import java.lang.all;

import org.eclipse.core.runtime.Assert;
import org.eclipse.core.runtime.AssertionFailedException;

/**
 * @since 1.0
 */
public abstract class AbstractObservable : ChangeManager , IObservable {
    public override Realm getRealm(){
        return super.getRealm();
    }
    
    /**
     * @param realm
     */
    public this(Realm realm) {
        super(realm);
    }

    public synchronized void addChangeListener(IChangeListener listener) {
        addListener(ChangeEvent.TYPE, listener);
    }

    public synchronized void removeChangeListener(IChangeListener listener) {
        removeListener(ChangeEvent.TYPE, listener);
    }

    public synchronized void addStaleListener(IStaleListener listener) {
        addListener(StaleEvent.TYPE, listener);
    }

    public synchronized void removeStaleListener(IStaleListener listener) {
        removeListener(StaleEvent.TYPE, listener);
    }

    protected void fireChange() {
        checkRealm();
        fireEvent(new ChangeEvent(this));
    }

    protected void fireStale() {
        checkRealm();
        fireEvent(new StaleEvent(this));
    }

    /**
     * 
     */
    public synchronized void dispose() {
        super.dispose();
    }

    /**
     * Asserts that the realm is the current realm.
     * 
     * @see Realm#isCurrent()
     * @throws AssertionFailedException if the realm is not the current realm
     */
    protected void checkRealm() {
        Assert.isTrue(getRealm().isCurrent(),
                "This operation must be run within the observable's realm"); //$NON-NLS-1$
    }
}
