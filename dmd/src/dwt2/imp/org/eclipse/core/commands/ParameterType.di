/*******************************************************************************
 * Copyright (c) 2005, 2006 IBM Corporation and others.
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
module org.eclipse.core.commands.ParameterType;

import org.eclipse.core.commands.common.HandleObject;
import org.eclipse.core.commands.common.NotDefinedException;
import org.eclipse.core.internal.commands.util.Util;
import org.eclipse.core.commands.AbstractParameterValueConverter;
import org.eclipse.core.commands.IParameterTypeListener;
import org.eclipse.core.commands.ParameterTypeEvent;

import java.lang.all;

/**
 * <p>
 * Provides information about the type of a command parameter. Clients can use a
 * parameter type to check if an object matches the type of the parameter with
 * {@link #isCompatible(Object)} and can get an
 * {@link AbstractParameterValueConverter} to convert between objects matching
 * the parameter type and strings that encode the object's identity.
 * </p>
 * <p>
 * A command parameter is not required to declare a type. To determine if a
 * given parameter has a type, check if an {@link IParameter} implements
 * {@link ITypedParameter} and if so, use
 * {@link ITypedParameter#getParameterType()} like this:
 * </p>
 *
 * <pre>
 *                   IParameter parameter = // ... get IParameter from Command
 *                   if (parameter instanceof ITypedParameter) {
 *                     ParameterType type = ((ITypedParameter)parameter).getParameterType();
 *                     if (type !is null) {
 *                       // this parameter has a ParameterType
 *                     }
 *                   }
 * </pre>
 *
 * @see IParameter
 * @see ITypedParameter#getParameterType()
 * @since 3.2
 */
public final class ParameterType : HandleObject, Comparable {

    /**
     * TODO: this was copied from
     * org.eclipse.core.internal.expressions.Expressions is there a better place
     * to reference this?
     *
     * @param element
     *            The element to test; may be <code>null</code>.
     * @param type
     *            The type against which we are testing;may be <code>null</code>.
     * @return <code>true</code> if the <code>element</code> is an instance
     *         of <code>type</code>; <code>false</code> otherwise.
     */
    private static final bool isInstanceOf(Object element,
            String type) {
        // null isn't an instanceof of anything.
        if (element is null) {
            return false;
        }
        return isSubtype(element.classinfo, type);
    }

    /**
     * TODO: this was copied from
     * org.eclipse.core.internal.expressions.Expressions is there a better place
     * to reference this?
     *
     * @param clazz
     *            The class to match; may be <code>null</code>.
     * @param type
     *            The type against which we are testing;may be <code>null</code>.
     * @return <code>true</code> if the <code>element</code> is an instance
     *         of <code>type</code>; <code>false</code> otherwise.
     */
    private static final bool isSubtype(ClassInfo clazz, String type) {
        if (clazz.name.equals(type)) {
            return true;
        }
        ClassInfo superClass = clazz.base;
        if (superClass !is null && isSubtype(superClass, type)) {
            return true;
        }
        Interface[] interfaces = clazz.interfaces;
        for (int i = 0; i < interfaces.length; i++) {
            if (isSubtype(interfaces[i].classinfo, type)) {
                return true;
            }
        }
        return false;
    }

    /**
     * An {@link AbstractParameterValueConverter} for converting parameter
     * values between objects and strings. This may be <code>null</code>.
     */
    private /+transient+/ AbstractParameterValueConverter parameterTypeConverter;

    /**
     * A string specifying the object type of this parameter type. This will be
     * <code>null</code> when the parameter type is undefined but never null
     * when it is defined.
     */
    private /+transient+/ String type = null;

    /**
     * Constructs a new instance based on the given identifier. When a parameter
     * type is first constructed, it is undefined. Parameter types should only
     * be constructed by the {@link CommandManager} to ensure that the
     * identifier remains unique.
     *
     * @param id
     *            The identifier for this type. This value must not be
     *            <code>null</code>, and must be unique amongst all parameter
     *            types.
     */
    this(String id) {
        super(id);
    }

    /**
     * Adds a listener to this parameter type that will be notified when its
     * state changes.
     *
     * @param listener
     *            The listener to be added; must not be <code>null</code>.
     */
    public final void addListener(IParameterTypeListener listener) {
        addListenerObject(cast(Object)listener);
    }

    /**
     * Compares this parameter type with another object by comparing each of the
     * non-transient attributes.
     *
     * @param object
     *            The object with which to compare; must be an instance of
     *            {@link ParameterType}.
     * @return A negative integer, zero or a positive integer, if the object is
     *         greater than, equal to or less than this parameter type.
     */
    public final int compareTo(Object object) {
        ParameterType castedObject = cast(ParameterType) object;
        int compareTo = Util.compare(defined, castedObject.defined);
        if (compareTo is 0) {
            compareTo = Util.compare(id, castedObject.id);
        }
        return compareTo;
    }
    public final override int opCmp( Object object ){
        return compareTo( object );
    }

    /**
     * <p>
     * Defines this parameter type, setting the defined property to
     * <code>true</code>.
     * </p>
     * <p>
     * Notification is sent to all listeners that something has changed.
     * </p>
     *
     * @param type
     *            a string identifying the Java object type for this parameter
     *            type; <code>null</code> is interpreted as
     *            <code>"java.lang.Object"</code>
     * @param parameterTypeConverter
     *            an {@link AbstractParameterValueConverter} to perform
     *            string/object conversions for parameter values; may be
     *            <code>null</code>
     */
    public final void define(String type,
            AbstractParameterValueConverter parameterTypeConverter) {

        bool definedChanged = !this.defined;
        this.defined = true;

        this.type = (type is null) ? Object.classinfo.name : type;
        this.parameterTypeConverter = parameterTypeConverter;

        fireParameterTypeChanged(new ParameterTypeEvent(this, definedChanged));
    }

    /**
     * Notifies all listeners that this parameter type has changed. This sends
     * the given event to all of the listeners, if any.
     *
     * @param event
     *            The event to send to the listeners; must not be
     *            <code>null</code>.
     */
    private final void fireParameterTypeChanged(ParameterTypeEvent event) {
        if (event is null) {
            throw new NullPointerException(
                    "Cannot send a null event to listeners."); //$NON-NLS-1$
        }

        if (!isListenerAttached()) {
            return;
        }

        Object[] listeners = getListeners();
        for (int i = 0; i < listeners.length; i++) {
            IParameterTypeListener listener = cast(IParameterTypeListener) listeners[i];
            listener.parameterTypeChanged(event);
        }
    }

    /**
     * Returns the value converter associated with this parameter, if any.
     *
     * @return The parameter value converter, or <code>null</code> if there is
     *         no value converter for this parameter.
     * @throws NotDefinedException
     *             if the parameter type is not currently defined
     */
    public final AbstractParameterValueConverter getValueConverter() {
        if (!isDefined()) {
            throw new NotDefinedException(
                    "Cannot use getValueConverter() with an undefined ParameterType"); //$NON-NLS-1$
        }

        return parameterTypeConverter;
    }

    /**
     * Returns whether the provided value is compatible with this parameter
     * type. An object is compatible with a parameter type if the object is an
     * instance of the class defined as the parameter's type class.
     *
     * @param value
     *            an object to check for compatibility with this parameter type;
     *            may be <code>null</code>.
     * @return <code>true</code> if the value is compatible with this type,
     *         <code>false</code> otherwise
     * @throws NotDefinedException
     *             if the parameter type is not currently defined
     */
    public bool isCompatible(Object value) {
        if (!isDefined()) {
            throw new NotDefinedException(
                    "Cannot use isCompatible() with an undefined ParameterType"); //$NON-NLS-1$
        }
        return isInstanceOf(value, type);
    }

    /**
     * Unregisters listener for changes to properties of this parameter type.
     *
     * @param listener
     *            the instance to unregister. Must not be <code>null</code>.
     *            If an attempt is made to unregister an instance which is not
     *            already registered with this instance, no operation is
     *            performed.
     */
    public final void removeListener(IParameterTypeListener listener) {
        removeListenerObject(cast(Object)listener);
    }

    /**
     * The string representation of this parameter type. For debugging purposes
     * only. This string should not be shown to an end user.
     *
     * @return The string representation; never <code>null</code>.
     */
    public override final String toString() {
        if (string is null) {
            string = Format( "ParameterType({},{})", id, defined );
        }
        return string;
    }

    /**
     * Makes this parameter type become undefined. Notification is sent to all
     * listeners.
     */
    public override final void undefine() {
        string = null;

        final bool definedChanged = defined;
        defined = false;

        type = null;
        parameterTypeConverter = null;

        fireParameterTypeChanged(new ParameterTypeEvent(this, definedChanged));
    }

}

version (build) {
    debug {
        pragma(link, "dwt2corecommands");
    } else {
        pragma(link, "dwt2corecommands");
    }
}
