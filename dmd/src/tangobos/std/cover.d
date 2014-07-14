/*
 *  Copyright (C) 2005-2006 by Digital Mars, www.digitalmars.com
 *  Written by Walter Bright
 *
 *  This software is provided 'as-is', without any express or implied
 *  warranty. In no event will the authors be held liable for any damages
 *  arising from the use of this software.
 *
 *  Permission is granted to anyone to use this software for any purpose,
 *  including commercial applications, and to alter it and redistribute it
 *  freely, in both source and binary form, subject to the following
 *  restrictions:
 *
 *  o  The origin of this software must not be misrepresented; you must not
 *     claim that you wrote the original software. If you use this software
 *     in a product, an acknowledgment in the product documentation would be
 *     appreciated but is not required.
 *  o  Altered source versions must be plainly marked as such, and must not
 *     be misrepresented as being the original software.
 *  o  This notice may not be removed or altered from any source
 *     distribution.
 */

/**
 * Code coverage analyzer.
 * Bugs:
 *	$(UL
 *	$(LI the execution counters are 32 bits in size, and can overflow)
 *	$(LI inline asm statements are not counted)
 *	)
 * Macros:
 *	WIKI = Phobos/StdCover
 */

module std.cover;
version(DigitalMars){
    import tango.core.BitManip;
    private
    {
        extern (C) void dmd_coverSetMerge( bool flag );
        extern (C) void dmd_coverDestPath( char[] pathname );
        extern (C) void dmd_coverSourcePath( char[] pathname );
    }

    /***********************************
     * Set path to where source files are located.
     */

    void setSourceDir(char[] pathname)
    {
        dmd_coverSourcePath(pathname);
    }

    /***********************************
     * Set path to where listing files are to be written.
     */

    void setDestDir(char[] pathname)
    {
        dmd_coverDestPath(pathname);
    }

    /***********************************
     * Set merge mode.
     * Params:
     *	flag = true means new data is summed with existing data in the
     *		listing file; false means a new listing file is always
     *		created.
     */

    void setMerge(bool flag)
    {
        dmd_coverSetMerge(flag);
    }

    struct BitArray
    {
        size_t  len;
        uint*   ptr;

        bool opIndex( size_t i )
        in
        {
            assert( i < len );
        }
        body
        {
            return cast(bool) bt( ptr, i );
        }
    }

    extern (C) void _d_cover_register(char[] filename, BitArray valid, uint[] data);

}