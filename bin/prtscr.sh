#!/bin/bash

pushd ~/screenshots
scrot
scrot newest.png
scp newest.png spill@aelv.se:~/public_html/screen.png
echo "aelv.se/spill/screen.png" | xclip -i -selection clipboard
popd
