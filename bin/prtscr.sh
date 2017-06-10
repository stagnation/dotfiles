#!/bin/sh

screenshotdir=~/screenshot
time=$(date +%s)
mkdir -p $screenshotdir

scrot "$screenshotdir"/"$time".png
echo "http://www.aelv.se/spill/screen.png" | xclip -i -selection clipboard
echo "http://www.aelv.se/spill/screen.png" | xclip -i -selection primary
echo "http://www.aelv.se/spill/screen.png saved in clipboard"
scp "$screenshotdir"/"$time".png spill@aelv:~/public_html/screen.png
scp "$screenshotdir"/"$time".png spill@aelv:~/public_html/"$time".png
