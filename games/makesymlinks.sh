#!/bin/sh
dotfilesdir="/home/spill/dotfiles/"
gameshomedir="/home/games/"
warsowconfig="$gameshomedir/.local/share/warsow-2.1/basewsw"
quakeconfig="$gameshomedir/.q3a/cpma/"

ln -s "$dotfilesdir"/games/binds.cfg    "$warsowconfig"/binds.cfg
ln -s "$dotfilesdir"/games/warsow.cfg   "$warsowconfig"/config.cfg

ln -s "$dotfilesdir"/games/q3config.cfg "$quakeconfig"/q3config.cfg
ln -s "$dotfilesdir"/games/spill45.cfg  "$quakeconfig"/hud/spill45.cfg
