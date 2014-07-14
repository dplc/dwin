// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.design.Singleton;


/**
    This is the mixin for a quick basic implementation of a Singleton.
    Note the use of a static variable local to the method, and the special 'typeof(this)'
    type expression which allows the mixin to work without knowing the class using it.
    Example:
    ---
        class T
        {
            mixin Singleton_simple;
            //mixin Singleton_safe;
        }
        auto t = T.getInstance();
    ---
 */

template Singleton_simple ()
{
    protected static typeof(this) instance;
    public static typeof(this) getInstance ()
    {
        if(instance is null)
            instance = new typeof(this);
        return instance;
    }
    
    public static void setInstance( typeof(this) t )
    {
        instance = t;
    }
}

template Singleton_safe ()
{
    protected static typeof(this) instance;
    public static typeof(this) getInstance ()
    {
        volatile typeof(this) tmp = instance;
        if(!tmp)
        {
            synchronized
            {
                tmp = instance;
                if(!tmp)
                {
                   volatile tmp = new typeof(this);
                   instance = tmp;
                }
            }
        }
        return instance;
    }
    public static void setInstance(typeof(this) t)
    {
        instance = t;
    }    
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
