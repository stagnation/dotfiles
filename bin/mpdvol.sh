#!/bin/bash
output=$(mpc -h 192.168.1.8 volume 2> /dev/null || echo "")
echo ${output:7:12}
