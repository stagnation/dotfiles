#!/bin/sh

create_new_session="new-session -s _$(random_word.sh)"
urxvt -cd "`xcwd`" -e tmux -u new-session -s _`random_word.sh` || urxvt
