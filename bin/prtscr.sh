#!/bin/sh

screenshotdir=~/screenshot
time=$(date +%s)
mkdir -p $screenshotdir

localscreenpath="$screenshotdir"/"$time".png
scrot $localscreenpath

ssh spill@aelv "mkdir -p ~/public_html/screens"

scp $localscreenpath spill@aelv:~/public_html/screen.png
scp $localscreenpath spill@aelv:~/public_html/screens/"$time".png

echo "http://www.aelv.se/spill/screen.png" | xclip -i -selection clipboard
echo "http://www.aelv.se/spill/screen.png" | xclip -i -selection primary
echo "http://www.aelv.se/spill/screen.png saved in clipboard"
