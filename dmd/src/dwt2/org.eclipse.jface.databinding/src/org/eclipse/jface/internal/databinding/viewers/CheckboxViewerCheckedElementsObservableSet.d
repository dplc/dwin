/*******************************************************************************
 * Copyright (c) 2008 Matthew Hall and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Matthew Hall - initial API and implementation (bug 124684)
 ******************************************************************************/

module org.eclipse.jface.internal.databinding.viewers.CheckboxViewerCheckedElementsObservableSet;
import org.eclipse.jface.internal.databinding.viewers.ViewerElementSet;
import org.eclipse.jface.internal.databinding.viewers.CheckableCheckedElementsObservableSet;

import java.lang.all;

import java.util.Arrays;
import java.util.Set;
import java.util.Collection;
import java.util.Iterator;

import org.eclipse.core.databinding.observable.Realm;
import org.eclipse.jface.databinding.viewers.IViewerObservableSet;
import org.eclipse.jface.viewers.CheckboxTableViewer;
import org.eclipse.jface.viewers.CheckboxTreeViewer;
import org.eclipse.jface.viewers.StructuredViewer;
import org.eclipse.jface.viewers.Viewer;

/**
 * An observable set that tracks the checked elements in a CheckboxTableViewer
 * or CheckboxTreeViewer
 * 
 * @since 1.2
 */
public class CheckboxViewerCheckedElementsObservableSet :
        CheckableCheckedElementsObservableSet , IViewerObservableSet {
    public override Object getElementType(){
        return super.getElementType();
    }
    public override bool add(Object o){
        return super.add(o);
    }
    public override bool add(String o){
        return super.add(o);
    }
    public override bool addAll(Collection o){
        return super.addAll(o);
    }
    public override bool contains(Object o){
        return super.contains(o);
    }
    public override bool containsAll(Collection o){
        return super.containsAll(o);
    }
    public override void clear(){
        super.clear();
    }
    public override bool isEmpty(){
        return super.isEmpty();
    }
    public override equals_t opEquals(Object o){
        return super.opEquals(o);
    }
    public override Iterator iterator(){
        return super.iterator();
    }
    public override hash_t toHash(){
        return super.toHash();
    }
    public override bool remove(String o){
        return super.remove(o);
    }
    public override bool remove(Object o){
        return super.remove(o);
    }
    //public override Object remove(int o){
    //    return super.remove(o);
    //}
    public override bool removeAll(Collection o){
        return super.removeAll(o);
    }
    public override bool retainAll(Collection o){
        return super.retainAll(o);
    }
    public override int size(){
        return super.size();
    }
    public override Object[] toArray(){
        return super.toArray();
    }
    public override Object[] toArray(Object[] o){
        return super.toArray(o);
    }
    //public override String[] toArray(String[] o){
    //    return super.toArray(o);
    //}
    public override int opApply( int delegate( ref Object v ) dg ){
        return super.opApply(dg);
    }
    private StructuredViewer viewer;

    /**
     * Constructs a new instance on the given realm and checkable.
     * 
     * @param realm
     *            the observable's realm
     * @param viewer
     *            the CheckboxTableViewer viewer to track.
     * @param elementType
     *            type of elements in the set
     */
    public this(Realm realm,
            CheckboxTableViewer viewer, Object elementType) {
        super(realm, viewer, elementType, createElementSet(viewer));
        this.viewer = viewer;
    }

    /**
     * Constructs a new instance on the given realm and checkable.
     * 
     * @param realm
     *            the observable's realm
     * @param viewer
     *            the CheckboxTreeViewer viewer to track.
     * @param elementType
     *            type of elements in the set
     */
    public this(Realm realm,
            CheckboxTreeViewer viewer, Object elementType) {
        super(realm, viewer, elementType, createElementSet(viewer));
        this.viewer = viewer;
    }

    Set createDiffSet() {
        return ViewerElementSet.withComparer(viewer.getComparer());
    }

    private static Set createElementSet(CheckboxTableViewer viewer) {
        Set set = ViewerElementSet.withComparer(viewer.getComparer());
        set.addAll(Arrays.asList(viewer.getCheckedElements()));
        return set;
    }

    private static Set createElementSet(CheckboxTreeViewer viewer) {
        Set set = ViewerElementSet.withComparer(viewer.getComparer());
        set.addAll(Arrays.asList(viewer.getCheckedElements()));
        return set;
    }

    public Viewer getViewer() {
        return viewer;
    }

    public synchronized void dispose() {
        viewer = null;
        super.dispose();
    }
}
