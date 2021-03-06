/*******************************************************************************
 * Copyright (c) 2004, 2007 IBM Corporation and others.
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
module org.eclipse.core.commands.CommandEvent;

import org.eclipse.core.commands.common.AbstractNamedHandleEvent;
import org.eclipse.core.commands.Command;

import java.lang.all;

/**
 * An instance of this class describes changes to an instance of
 * <code>Command</code>.
 * <p>
 * This class is not intended to be extended by clients.
 * </p>
 *
 * @since 3.1
 * @see ICommandListener#commandChanged(CommandEvent)
 */
public final class CommandEvent : AbstractNamedHandleEvent {

    /**
     * The bit used to represent whether the command has changed its category.
     */
    private static const int CHANGED_CATEGORY = LAST_USED_BIT << 1;

    /**
     * The bit used to represent whether the command has changed its handler.
     */
    private static const int CHANGED_HANDLED = LAST_USED_BIT << 2;

    /**
     * The bit used to represent whether the command has changed its parameters.
     */
    private static const int CHANGED_PARAMETERS = LAST_USED_BIT << 3;

    /**
     * The bit used to represent whether the command has changed its return
     * type.
     *
     * @since 3.2
     */
    private static const int CHANGED_RETURN_TYPE = LAST_USED_BIT << 4;

    /**
     * The bit used to represent whether the command has changed its help
     * context identifier.
     *
     * @since 3.2
     */
    private static const int CHANGED_HELP_CONTEXT_ID = LAST_USED_BIT << 5;

    /**
     * The bit used to represent whether this commands active handler has
     * changed its enablement state.
     *
     * @since 3.3
     */
    private static const int CHANGED_ENABLED = LAST_USED_BIT << 6;

    /**
     * The command that has changed; this value is never <code>null</code>.
     */
    private const Command command;

    /**
     * Creates a new instance of this class.
     *
     * @param command
     *            the instance of the interface that changed.
     * @param categoryChanged
     *            <code>true</code>, iff the category property changed.
     * @param definedChanged
     *            <code>true</code>, iff the defined property changed.
     * @param descriptionChanged
     *            <code>true</code>, iff the description property changed.
     * @param handledChanged
     *            <code>true</code>, iff the handled property changed.
     * @param nameChanged
     *            <code>true</code>, iff the name property changed.
     * @param parametersChanged
     *            <code>true</code> if the parameters have changed;
     *            <code>false</code> otherwise.
     */
    public this(Command command, bool categoryChanged,
            bool definedChanged, bool descriptionChanged,
            bool handledChanged, bool nameChanged,
            bool parametersChanged) {
        this(command, categoryChanged, definedChanged, descriptionChanged,
                handledChanged, nameChanged, parametersChanged, false);
    }

    /**
     * Creates a new instance of this class.
     *
     * @param command
     *            the instance of the interface that changed.
     * @param categoryChanged
     *            <code>true</code>, iff the category property changed.
     * @param definedChanged
     *            <code>true</code>, iff the defined property changed.
     * @param descriptionChanged
     *            <code>true</code>, iff the description property changed.
     * @param handledChanged
     *            <code>true</code>, iff the handled property changed.
     * @param nameChanged
     *            <code>true</code>, iff the name property changed.
     * @param parametersChanged
     *            <code>true</code> if the parameters have changed;
     *            <code>false</code> otherwise.
     * @param returnTypeChanged
     *            <code>true</code> iff the return type property changed;
     *            <code>false</code> otherwise.
     * @since 3.2
     */
    public this(Command command, bool categoryChanged,
            bool definedChanged, bool descriptionChanged,
            bool handledChanged, bool nameChanged,
            bool parametersChanged, bool returnTypeChanged) {
        this(command, categoryChanged, definedChanged, descriptionChanged,
                handledChanged, nameChanged, parametersChanged,
                returnTypeChanged, false);
    }

    /**
     * Creates a new instance of this class.
     *
     * @param command
     *            the instance of the interface that changed.
     * @param categoryChanged
     *            <code>true</code>, iff the category property changed.
     * @param definedChanged
     *            <code>true</code>, iff the defined property changed.
     * @param descriptionChanged
     *            <code>true</code>, iff the description property changed.
     * @param handledChanged
     *            <code>true</code>, iff the handled property changed.
     * @param nameChanged
     *            <code>true</code>, iff the name property changed.
     * @param parametersChanged
     *            <code>true</code> if the parameters have changed;
     *            <code>false</code> otherwise.
     * @param returnTypeChanged
     *            <code>true</code> iff the return type property changed;
     *            <code>false</code> otherwise.
     * @param helpContextIdChanged
     *            <code>true</code> iff the help context identifier changed;
     *            <code>false</code> otherwise.
     * @since 3.2
     */
    public this(Command command, bool categoryChanged,
            bool definedChanged, bool descriptionChanged,
            bool handledChanged, bool nameChanged,
            bool parametersChanged, bool returnTypeChanged,
            bool helpContextIdChanged) {
        this(command, categoryChanged, definedChanged, descriptionChanged,
                handledChanged, nameChanged, parametersChanged,
                returnTypeChanged, helpContextIdChanged, false);
    }

    /**
     * Creates a new instance of this class.
     *
     * @param command
     *            the instance of the interface that changed.
     * @param categoryChanged
     *            <code>true</code>, iff the category property changed.
     * @param definedChanged
     *            <code>true</code>, iff the defined property changed.
     * @param descriptionChanged
     *            <code>true</code>, iff the description property changed.
     * @param handledChanged
     *            <code>true</code>, iff the handled property changed.
     * @param nameChanged
     *            <code>true</code>, iff the name property changed.
     * @param parametersChanged
     *            <code>true</code> if the parameters have changed;
     *            <code>false</code> otherwise.
     * @param returnTypeChanged
     *            <code>true</code> iff the return type property changed;
     *            <code>false</code> otherwise.
     * @param helpContextIdChanged
     *            <code>true</code> iff the help context identifier changed;
     *            <code>false</code> otherwise.
     * @param enabledChanged
     *            <code>true</code> iff the comand enablement changed;
     *            <code>false</code> otherwise.
     * @since 3.3
     */
    public this(Command command, bool categoryChanged,
            bool definedChanged, bool descriptionChanged,
            bool handledChanged, bool nameChanged,
            bool parametersChanged, bool returnTypeChanged,
            bool helpContextIdChanged, bool enabledChanged) {
        super(definedChanged, descriptionChanged, nameChanged);

        if (command is null) {
            throw new NullPointerException();
        }
        this.command = command;

        if (categoryChanged) {
            changedValues |= CHANGED_CATEGORY;
        }
        if (handledChanged) {
            changedValues |= CHANGED_HANDLED;
        }
        if (parametersChanged) {
            changedValues |= CHANGED_PARAMETERS;
        }
        if (returnTypeChanged) {
            changedValues |= CHANGED_RETURN_TYPE;
        }
        if (helpContextIdChanged) {
            changedValues |= CHANGED_HELP_CONTEXT_ID;
        }
        if (enabledChanged) {
            changedValues |= CHANGED_ENABLED;
        }
    }

    /**
     * Returns the instance of the interface that changed.
     *
     * @return the instance of the interface that changed. Guaranteed not to be
     *         <code>null</code>.
     */
    public final Command getCommand() {
        return command;
    }

    /**
     * Returns whether or not the category property changed.
     *
     * @return <code>true</code>, iff the category property changed.
     */
    public final bool isCategoryChanged() {
        return ((changedValues & CHANGED_CATEGORY) !is 0);
    }

    /**
     * Returns whether or not the handled property changed.
     *
     * @return <code>true</code>, iff the handled property changed.
     */
    public final bool isHandledChanged() {
        return ((changedValues & CHANGED_HANDLED) !is 0);
    }

    /**
     * Returns whether or not the help context identifier changed.
     *
     * @return <code>true</code>, iff the help context identifier changed.
     * @since 3.2
     */
    public final bool isHelpContextIdChanged() {
        return ((changedValues & CHANGED_HELP_CONTEXT_ID) !is 0);
    }

    /**
     * Returns whether or not the parameters have changed.
     *
     * @return <code>true</code>, iff the parameters property changed.
     */
    public final bool isParametersChanged() {
        return ((changedValues & CHANGED_PARAMETERS) !is 0);
    }

    /**
     * Returns whether or not the return type property changed.
     *
     * @return <code>true</code>, iff the return type property changed.
     * @since 3.2
     */
    public final bool isReturnTypeChanged() {
        return ((changedValues & CHANGED_RETURN_TYPE) !is 0);
    }

    /**
     * Return whether the enable property changed.
     *
     * @return <code>true</code> iff the comand enablement changed
     * @since 3.3
     */
    public final bool isEnabledChanged() {
        return ((changedValues & CHANGED_ENABLED) !is 0);
    }

}

version (build) {
    debug {
        pragma(link, "dwt2corecommands");
    } else {
        pragma(link, "dwt2corecommands");
    }
}
