
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Jan 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
        
        A bridge between Php and D programming language

*******************************************************************************/


module ydb.bridge.php.Php;

public import   ydb.bridge.php.Array,
                ydb.bridge.php.Preg,
                ydb.bridge.php.String;








version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
