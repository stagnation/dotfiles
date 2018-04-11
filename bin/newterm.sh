#!/bin/sh

word="$(random_word.sh)"
name_length=$(echo $word | wc -c)
padding_required=$((9 - $name_length))
padding=$(head -c $padding_required < /dev/zero | tr '\0' ' ')
session_name="$padding$word"

urxvt -cd "`xcwd`" -e tmux -u new-session -s "_$session_name" || urxvt
