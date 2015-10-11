#!/bin/sh
mpc='mpc -h 192.168.1.8'

for url in `youtube-dl -g "$1"`
do
    revlist="$url $revlist"
done

for url in $revlist
do
	$mpc insert "$url"
done
