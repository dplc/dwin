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
module org.eclipse.jface.text.reconciler.AbstractReconcileStep;

import org.eclipse.jface.text.reconciler.IReconciler; // packageimport
import org.eclipse.jface.text.reconciler.DirtyRegionQueue; // packageimport
import org.eclipse.jface.text.reconciler.IReconcilingStrategy; // packageimport
import org.eclipse.jface.text.reconciler.IReconcilingStrategyExtension; // packageimport
import org.eclipse.jface.text.reconciler.MonoReconciler; // packageimport
import org.eclipse.jface.text.reconciler.IReconcileStep; // packageimport
import org.eclipse.jface.text.reconciler.AbstractReconciler; // packageimport
import org.eclipse.jface.text.reconciler.Reconciler; // packageimport
import org.eclipse.jface.text.reconciler.IReconcilableModel; // packageimport
import org.eclipse.jface.text.reconciler.DirtyRegion; // packageimport
import org.eclipse.jface.text.reconciler.IReconcileResult; // packageimport
import org.eclipse.jface.text.reconciler.IReconcilerExtension; // packageimport


import java.lang.all;
import java.util.Arrays;
import java.util.Collection;
import java.util.ArrayList;
import java.util.Set;




import org.eclipse.core.runtime.Assert;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.jface.text.IRegion;


/**
 * Abstract implementation of a reconcile step.
 *
 * @since 3.0
 */
public abstract class AbstractReconcileStep : IReconcileStep {

    private IReconcileStep fNextStep;
    private IReconcileStep fPreviousStep;
    private IProgressMonitor fProgressMonitor;
    protected IReconcilableModel fInputModel;

    /**
     * Creates an intermediate reconcile step which adds
     * the given step to the pipe.
     *
     * @param step the reconcile step
     */
    public this(IReconcileStep step) {
        Assert.isNotNull(cast(Object)step);
        fNextStep= step;
        fNextStep.setPreviousStep(this);
    }

    /**
     * Creates the last reconcile step of the pipe.
     */
    public this() {
    }

    public bool isLastStep() {
        return fNextStep is null;
    }

    public bool isFirstStep() {
        return fPreviousStep is null;
    }

    /*
     * @see org.eclipse.text.reconcilerpipe.IReconcilerResultCollector#setProgressMonitor(org.eclipse.core.runtime.IProgressMonitor)
     */
    public void setProgressMonitor(IProgressMonitor monitor) {
        fProgressMonitor= monitor;

        if (!isLastStep())
            fNextStep.setProgressMonitor(monitor);
    }

    /*
     * @see org.eclipse.jface.text.reconciler.IReconcileStep#getProgressMonitor()
     */
    public IProgressMonitor getProgressMonitor() {
        return fProgressMonitor;
    }

    /*
     * @see IReconcileStep#reconcile(IRegion)
     */
    public final IReconcileResult[] reconcile(IRegion partition) {
        IReconcileResult[] result= reconcileModel(null, partition);
        if (!isLastStep()) {
            fNextStep.setInputModel(getModel());
            IReconcileResult[] nextResult= fNextStep.reconcile(partition);
            return merge(result, convertToInputModel(nextResult));
        }
        return result;
    }

    /*
     * @see IReconcileStep#reconcile(org.eclipse.jface.text.reconciler.DirtyRegion, org.eclipse.jface.text.IRegion)
     */
    public final IReconcileResult[] reconcile(DirtyRegion dirtyRegion, IRegion subRegion) {
        IReconcileResult[] result= reconcileModel(dirtyRegion, subRegion);
        if (!isLastStep()) {
            fNextStep.setInputModel(getModel());
            IReconcileResult[] nextResult= fNextStep.reconcile(dirtyRegion, subRegion);
            return merge(result, convertToInputModel(nextResult));
        }
        return result;
    }


    /**
     * Reconciles the model of this reconcile step. The
     * result is based on the input model.
     *
     * @param dirtyRegion the document region which has been changed
     * @param subRegion the sub region in the dirty region which should be reconciled
     * @return an array with reconcile results
     */
    abstract protected IReconcileResult[] reconcileModel(DirtyRegion dirtyRegion, IRegion subRegion);

    /**
     * Adapts the given an array with reconcile results to
     * this step's input model and returns it.
     *
     * @param inputResults an array with reconcile results
     * @return an array with the reconcile results adapted to the input model
     */
    protected IReconcileResult[] convertToInputModel(IReconcileResult[] inputResults) {
        return inputResults;
    }

    /**
     * Merges the two reconcile result arrays.
     *
     * @param results1 an array with reconcile results
     * @param results2 an array with reconcile results
     * @return an array with the merged reconcile results
     */
    private IReconcileResult[] merge(IReconcileResult[] results1, IReconcileResult[] results2) {
        if (results1 is null)
            return results2;

        if (results2 is null)
            return results1;

        // XXX: not yet performance optimized
        Collection collection= new ArrayList(Arrays.asList(arraycast!(Object)(results1)));
        collection.addAll(Arrays.asList(arraycast!(Object)(results2)));
        return arraycast!(IReconcileResult)(collection.toArray());
    }

    /*
     * @see IProgressMonitor#isCanceled()
     */
    protected final bool isCanceled() {
        return fProgressMonitor !is null && fProgressMonitor.isCanceled();
    }

    /*
     * @see IReconcileStep#setPreviousStep(IReconcileStep)
     */
    public void setPreviousStep(IReconcileStep step) {
        Assert.isNotNull(cast(Object)step);
        Assert.isTrue(fPreviousStep is null);
        fPreviousStep= step;
    }

    /*
     * @see IReconcileStep#setInputModel(Object)
     */
    public void setInputModel(IReconcilableModel inputModel) {
        fInputModel= inputModel;

        if (!isLastStep())
            fNextStep.setInputModel(getModel());
    }

    /**
     * Returns the reconcilable input model.
     *
     * @return the reconcilable input model.
     */
    public IReconcilableModel getInputModel() {
        return fInputModel;
    }

    /**
     * Returns the reconcilable model.
     *
     * @return the reconcilable model
     */
    abstract public IReconcilableModel getModel();
}
