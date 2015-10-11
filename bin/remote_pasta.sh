#!/usr/bin/env bash
#take filename argument.

FILE="/home/spill/scratch/remotepasta"
if [ $# -ge 1 ] ; then
    if [ -f ${1} ] ; then
        cp $1 $FILE
    else
        echo "illegal file specified"
    fi
else
    #if no file upload contents of clipboard
    xclip -o -selection clipboard > $FILE
fi
chmod -rwx $FILE
chmod 644 $FILE
scp $FILE spill@aelv.se:~/public_html/pasta.txt
if [ $# -le 2 ] ; then
    echo http://aelv.se/spill/pasta.txt | xclip -i -selection clipboard
    echo http://aelv.se/spill/pasta.txt | xclip -i -selection primary
    echo "http://aelv.se/spill/pasta.txt copied to clipboard"
fi
