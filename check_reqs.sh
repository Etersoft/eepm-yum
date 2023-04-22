#!/bin/sh

LIST="bin/*"

if [ "$1" = "--detail" ] ; then
    if [ -n "$2" ] ; then
        LIST="$2"
        bash --rpm-requires $LIST | sort -u | grep "executable"
        exit
    fi
    for i in $LIST  ; do
        echo
        echo "==== $i:"
        /usr/lib/rpm/shell.req $i
    done
    exit 0
fi

/usr/lib/rpm/shell.req $LIST | sort -u | tee ./check_eepm.log
git diff ./check_eepm.log
