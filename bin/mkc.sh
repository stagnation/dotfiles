#!/bin/bash

if [ $# -ge 1 ] ; then
    if [ -f ${1} ] ; then
        echo "error: file already exists"
    else
        cp ~/arbete/resources/c/blank.c ./${1}
        cp ~/arbete/resources/c/ycm_extra_conf.py.DOT ./.ycm_extra_conf.py
        vim ./${1}
    fi
else
    echo "error: provide filename"
fi
