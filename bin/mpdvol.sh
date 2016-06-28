#!/bin/bash
if [ $# -ge 1 ] ; then
    ip=$1
else
    ip=$(sshhost2ip serv)
fi

ping $ip -c 1 -q -w 0.01 &>/dev/null
if [ $? -ne 1 ] ; then
    output=$(mpc -h $ip volume 2> /dev/null || echo "")
    output=${output:7:12}
    echo $output
else
    echo "mpd down"
fi
exit 0

