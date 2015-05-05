#!/bin/bash
FILENAME="$1"
TMPFILE="/home/spill/scratch/tmp_aelvul"

if [ -f $FILENAME ] ; then
    cp $FILENAME $TMPFILE
    chmod 644 $TMPFILE
    scp $TMPFILE spill@aelv.se:~/public_html/ul/${1}
    echo "saved to spill@aelv.se:~/public_html/ul/$FILENAME"
    if [ $# -ge 2 ] ; then
        echo http://aelv.se/spill/ul/$FILENAME | xclip -i -selection clipboard
        echo http://aelv.se/spill/ul/$FILENAME | xclip -i -selection primary
        echo "http://aelv.se/spill/ul/$FILENAME copied to clipboard"
    fi
else
    echo "file does not exist"
    echo $FILENAME


fi
