/*******************************************************************************
 * Copyright (c) 2000, 2005 IBM Corporation and others.
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
module org.eclipse.jface.text.source.IAnnotationModelListener;
import org.eclipse.jface.text.source.IAnnotationMap;
import org.eclipse.jface.text.source.IAnnotationModelListenerExtension;
import org.eclipse.jface.text.source.AnnotationModelEvent;
import org.eclipse.jface.text.source.IAnnotationModelExtension2;
import org.eclipse.jface.text.source.IAnnotationModel;
import org.eclipse.jface.text.source.AnnotationMap;
import org.eclipse.jface.text.source.IAnnotationModelExtension;
import org.eclipse.jface.text.source.AnnotationModel;
import org.eclipse.jface.text.source.Annotation;



import java.lang.all;


/**
 * Interface for objects interested in getting informed about annotation model
 * changes. Changes are the addition or removal of annotations managed by the
 * model. Clients may implement this interface.
 *
 * In order to provided backward compatibility for clients of
 * <code>IAnnotationModelListener</code>, extension interfaces are used to
 * provide a means of evolution. The following extension interfaces exist:
 * <ul>
 * <li>{@link org.eclipse.jface.text.source.IAnnotationModelListenerExtension}
 *     since version 2.0 replacing the change notification mechanisms.</li>
 * </ul>
 *
 * @see org.eclipse.jface.text.source.IAnnotationModel
 */
public interface IAnnotationModelListener {

    /**
     * Called if a model change occurred on the given model.<p>
     * Replaced by {@link IAnnotationModelListenerExtension#modelChanged(AnnotationModelEvent)}.
     *
     * @param model the changed annotation model
     */
    void modelChanged(IAnnotationModel model);
}
