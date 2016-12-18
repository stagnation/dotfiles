#!/bin/bash
if [ $# -ge 1 ] ; then
    ip=$1
else
    ip=$(sshhost2ip serv)
fi

ping $ip -c 1 -q -w 0.01 &>/dev/null
if [ $? -eq 0 ] ; then
    output=$(mpc -h $ip volume 2> /dev/null || echo "")
    output=${output:7:12}
    echo $output
    exit 0
else
    echo "mpd down"
    exit 1
fi

