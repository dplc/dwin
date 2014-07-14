/*******************************************************************************
 * Copyright (c) 2004, 2006 IBM Corporation and others.
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
module org.eclipse.jface.resource.LocalResourceManager;

import org.eclipse.jface.resource.AbstractResourceManager;
import org.eclipse.jface.resource.ResourceManager;
import org.eclipse.jface.resource.DeviceResourceDescriptor;

import org.eclipse.swt.events.DisposeEvent;
import org.eclipse.swt.events.DisposeListener;
import org.eclipse.swt.graphics.Device;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.widgets.Control;

import java.lang.all;

/**
 * A local registry that shares its resources with some global registry.
 * LocalResourceManager is typically used to safeguard against leaks. Clients
 * can use a nested registry to allocate and deallocate resources in the
 * global registry. Calling dispose() on the nested registry will deallocate
 * everything allocated for the nested registry without affecting the rest
 * of the global registry.
 * <p>
 * A nested registry can be used to manage the resources for, say, a dialog
 * box.
 * </p>
 * @since 3.1
 */
public final class LocalResourceManager : AbstractResourceManager {

    private ResourceManager parentRegistry;

    /**
     * Creates a local registry that delegates to the given global registry
     * for all resource allocation and deallocation.
     *
     * @param parentRegistry global registry
     */
    public this(ResourceManager parentRegistry) {
        this.parentRegistry = parentRegistry;
    }

    /**
     * Creates a local registry that wraps the given global registry. Anything
     * allocated by this registry will be automatically cleaned up with the given
     * control is disposed. Note that registries created in this way should not
     * be used to allocate any resource that must outlive the given control.
     *
     * @param parentRegistry global registry that handles resource allocation
     * @param owner control whose disposal will trigger cleanup of everything
     * in the registry.
     */
    public this(ResourceManager parentRegistry, Control owner) {
        this(parentRegistry);

        owner.addDisposeListener(new class DisposeListener {
            /* (non-Javadoc)
             * @see org.eclipse.swt.events.DisposeListener#widgetDisposed(org.eclipse.swt.events.DisposeEvent)
             */
            public void widgetDisposed(DisposeEvent e) {
                this.outer.dispose();
            }
        });
    }

    /* (non-Javadoc)
     * @see org.eclipse.jface.resource.ResourceManager#getDevice()
     */
    public override Device getDevice() {
        return parentRegistry.getDevice();
    }

    /* (non-Javadoc)
     * @see org.eclipse.jface.resource.AbstractResourceManager#allocate(org.eclipse.jface.resource.DeviceResourceDescriptor)
     */
    protected override Object allocate(DeviceResourceDescriptor descriptor) {
        return parentRegistry.create(descriptor);
    }

    /* (non-Javadoc)
     * @see org.eclipse.jface.resource.AbstractResourceManager#deallocate(java.lang.Object, org.eclipse.jface.resource.DeviceResourceDescriptor)
     */
    protected override void deallocate(Object resource,
            DeviceResourceDescriptor descriptor) {

        parentRegistry.destroy(descriptor);
    }

    /* (non-Javadoc)
     * @see org.eclipse.jface.resource.ResourceManager#getDefaultImage()
     */
    protected override Image getDefaultImage() {
        return parentRegistry.getDefaultImage_();
    }
}
