#!/bin/bash
ping 192.168.1.8 -c 1 -q -w 0.1 &>/dev/null
if [ $? -ne 1 ] ; then
    output=$(mpc -h 192.168.1.8 volume 2> /dev/null || echo "")
    output=${output:7:12}
    echo $output
else
    echo "mpd down"
fi
exit 0
