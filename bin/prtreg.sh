#!/bin/bash

pushd ~/screenshots
scrot -s -e 'cp $f newest.png'
echo "http://www.aelv.se/spill/screen.png" | xclip -i -selection clipboard
echo "http://www.aelv.se/spill/screen.png" | xclip -i -selection primary
echo "http://www.aelv.se/spill/screen.png saved in clipboard"
scp newest.png spill@aelv.se:~/public_html/screen.png
popd
