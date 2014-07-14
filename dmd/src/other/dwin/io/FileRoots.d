
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.io.FileRoots;

private import dwin.sys.win32.CodePage;
private import tango.sys.win32.UserGdi;
    
version(Windows)
{

    private import dwin.sys.win32.Wrapper;
    
    /**
    UINT GetDriveTypeW(LPCWSTR lpRootPathName);
    const UINT DRIVE_UNKNOWN     = 0; //The drive type cannot be determined. 
    const UINT DRIVE_NO_ROOT_DIR = 1; //The root path is invalid; for example, there is no volume is mounted at the path. 
    const UINT DRIVE_REMOVABLE   = 2; //The drive has removable media; for example, a floppy drive, thumb drive, or flash card reader. 
    const UINT DRIVE_FIXED       = 3; //The drive has fixed media; for example, a hard drive or flash drive. 
    const UINT DRIVE_REMOTE      = 4; //The drive is a remote (network) drive. 
    const UINT DRIVE_CDROM       = 5; //The drive is a CD-ROM drive. 
    const UINT DRIVE_RAMDISK     = 6; //The drive is a RAM disk.
    */

    /** 
        Authors: 
            Regan Heath
            http://svn.dsource.org/projects/scrapple/trunk/filesystem/  
        ported to Tango by yidabu        
    */
    template sortDrive(uint TYPE) 
    { 
        char[][] sortDrive() 
        {
            char[][] list;
            
            foreach(drive; getLogicalDrives())
            {
                switch( GetDriveTypeW(toString16z(drive)) )
                {
                    case TYPE:
                        list ~= drive;
                        break;
                    default:
                        break;
                }
            }
            
            return list;
        }
    }

    alias sortDrive!(DRIVE_FIXED) 		fixedDrives;
    alias sortDrive!(DRIVE_REMOVABLE) 	removableDrives;
    alias sortDrive!(DRIVE_REMOTE) 		remoteDrives;
    alias sortDrive!(DRIVE_CDROM) 		cdDrives;
    alias sortDrive!(DRIVE_RAMDISK)		ramDrives;

    debug( UnitTest )
    {
        import tango.io.Stdout;
        
        void test(char[] info, char[][] list)
        {
            if(list.length)
            {
                Stdout(info).newline;
                foreach(v; list)
                    Stdout(v).newline;
            }
            else
                Stdout("not had ")(info).newline;
            
        }
        
        unittest
        {
            version(FileRootsVerbose)
            {
                test( "Fixed    : ", fixedDrives() );
                test( "Removable: ", removableDrives() );
                test( "Remote   : ", remoteDrives() );
                test( "Cd       : ", cdDrives() );
                test( "Ramdisk  : ", ramDrives() );
            }
        }
    }


}
//version(Windows)
