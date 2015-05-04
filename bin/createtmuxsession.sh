#!/bin/bash


tmux start-server
tmux new-session -d -s remote
tmux new-window  -n "media" -t remote:2
