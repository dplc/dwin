/*******************************************************************************
 * Copyright (c) 2006, 2007 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 ******************************************************************************/

module org.eclipse.core.databinding.observable.set.SetChangeEvent;
import org.eclipse.core.databinding.observable.set.SetDiff;
import org.eclipse.core.databinding.observable.set.ISetChangeListener;
import org.eclipse.core.databinding.observable.set.IObservableSet;

import java.lang.all;

import org.eclipse.core.databinding.observable.IObservablesListener;
import org.eclipse.core.databinding.observable.ObservableEvent;

/**
 * List change event describing an incremental change of an
 * {@link IObservableSet} object.
 * 
 * @since 1.0
 * 
 */
public class SetChangeEvent : ObservableEvent {

    /**
     * 
     */
    private static const long serialVersionUID = 7436547103857482256L;
    static const Object TYPE;
    static this(){
        TYPE = new Object();
    }

    /**
     * Description of the change to the source observable set. Listeners must
     * not change this field.
     */
    public SetDiff diff;

    /**
     * Creates a new set change event.
     * 
     * @param source
     *            the source observable set
     * @param diff
     *            the set change
     */
    public this(IObservableSet source, SetDiff diff) {
        super(source);
        this.diff = diff;
    }

    /**
     * Returns the observable set from which this event originated.
     * 
     * @return the observable set from which this event originated
     */
    public IObservableSet getObservableSet() {
        return cast(IObservableSet) getSource();
    }

    protected void dispatch(IObservablesListener listener) {
        (cast(ISetChangeListener) listener).handleSetChange(this);
    }

    protected Object getListenerType() {
        return TYPE;
    }

}

version (build) {
    debug {
        pragma(link, "dwt2coredatabinding");
    } else {
        pragma(link, "dwt2coredatabinding");
    }
}
