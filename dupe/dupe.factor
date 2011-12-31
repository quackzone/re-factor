! Copyright (C) 2011 John Benediktsson
! See http://factorcode.org/license.txt for BSD license

USING: assocs checksums checksums.md5 command-line formatting
fry io.directories.search io.pathnames kernel math namespaces
sequences ;

IN: dupe

: collect-files ( path -- assoc )
    t H{ } clone [
        '[ dup file-name _ push-at ] each-file
    ] keep ;

: duplicate-files ( path -- dupes )
    collect-files [ nip length 1 > ] assoc-filter! ;

: md5-file ( path -- string )
    md5 checksum-file hex-string ;

: print-md5 ( name paths -- )
    [ "%s:\n" printf ] [
        [ dup md5-file "  %s\n    %s\n" printf ] each
    ] bi* ;

: arg? ( name args -- args' ? )
    2dup member? [ remove t ] [ nip f ] if ;

: run-dupe ( verbose? root -- )
    duplicate-files swap [ dup [ print-md5 ] assoc-each ] when
    assoc-size "Total duped files found: %d\n" printf ;

: main-dupe ( -- )
    "--verbose" command-line get arg? swap first run-dupe ;

MAIN: main-dupe