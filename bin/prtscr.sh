#!/bin/bash

pushd ~/screenshots
scrot
scrot newest.png
scp newest.png spill@aelv.se:~/public_html/screen.png
echo "www.aelv.se/spill/screen.png" | xclip -i -selection clipboard
echo "aelv.se/spill/screen.png saved in clipboard"
popd
