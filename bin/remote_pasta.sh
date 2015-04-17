#!/usr/bin/env bash
#take filename argument.

if [ $# -ge 1 ] ; then
    if [ -f ${1} ] ; then

        FILE="/home/spill/scratch/remotepasta"
        cp $1 $FILE
        chmod -rwx $FILE
        chmod 644 $FILE
        scp $FILE spill@aelv.se:~/public_html/pasta.txt
        if [ $# -ge 2 ] ; then
            echo http://aelv.se/spill/pasta.txt | xclip -i -selection clipboard
            echo "http://aelv.se/spill/pasta.txt copied to clipboard"
        fi
    fi
fi
