#!/bin/sh

WORDS="/usr/share/dict/words"
SESSION_NAME=""

if test -f $WORDS;
then
    NAME="$(shuf -n1 $WORDS)"
    NAME=$(echo $NAME | sed \
        -e "s#'.*##"        \
        -e 's#er$##'        \
        -e 's#ed$##'        \
        -e 's#ing$##'       \
        -e 's#tly$##'       \
        -e 's#ally$##'      \
        -e 's#ly$##'        \
        -e 's#outs$##'      \
        -e 's#ism$##'       \
        -e 's#er$##'        \
        -e 's#.#\l&#'       \
        | cut -c 1-8        \
        )

    if test -z $NAME;
    then
        NAME="fallback"
    fi
fi

exec echo $NAME
