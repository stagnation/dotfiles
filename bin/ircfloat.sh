#!/bin/bash
delay=0.15
urxvt -e sh -c "mosh aelv" &
sleep $delay
i3-msg floating enable >/dev/null
i3-msg move right 475 >/dev/null
i3-msg resize shrink left 200 >/dev/null
