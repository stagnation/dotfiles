#!/bin/sh
set -x
mpc='mpc -h 192.168.1.8'

directlinks=$(ssh serv "youtube-dl -g $1")
# for url in `youtube-dl -g "$1"`
for url in $directlinks
do
	$mpc add "$url"
done
set +x
