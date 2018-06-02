#!/bin/sh

cd ~/screenshots || exit 1

unixtime=$(date +%s)
filename=${unixtime}.png

# NB(nils): this seems to be scrot default, but for clarify, and to have the
#           filename in a variable.

scrot -s "$filename" || exit 1

echo "http://www.aelv.se/spill/${filename}" | xclip -i -selection clipboard
echo "http://www.aelv.se/spill/${filename}" | xclip -i -selection primary
echo "http://www.aelv.se/spill/${filename} saved in clipboard"

scp "$filename" spill@aelv.se:~/public_html/
scp "$filename" spill@aelv.se:~/public_html/screen.png
