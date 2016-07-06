#!/bin/bash
command="mosh aelv"
if [ $# -ge 1 ] ; then
    command=$1
fi
echo $command

urxvt -depth 32 -bg rgba:0a00/1000/1500/dddd -name "float_term" & 2> /dev/null

# i3-msg floating enable >/dev/null
# i3-msg move right 475 >/dev/null
# i3-msg resize shrink left 200 >/dev/null
# i3-msg move to scratchpad
# i3-msg scratchpad show
