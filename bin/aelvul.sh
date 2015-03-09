#!/bin/bash

if [ $# -ge 1 ] ; then
    scp ${1} spill@aelv.se:~/public_html/ul/${1}
    echo spill@aelv.se:~/public_html/ul/${1}
    if [ $# -ge 2 ] ; then
        echo spill@aelv.se:~/public_html/ul/${1} | xclip -i -selection clipboard
    fi

fi
