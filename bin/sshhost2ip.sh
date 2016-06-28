#!/bin/sh
cat ~/.ssh/config | grep "Host $1" -C 1 | sed 's/HostName \(.*\)$/\1/p' -n
