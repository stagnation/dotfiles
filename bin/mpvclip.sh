#!/bin/bash
clip=$(xclip -o -selection clipboard)
notify-send "mpv open \n $clip" && mpv $(xclip -o) --ytdl-format=best

