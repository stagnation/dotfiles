#!/bin/bash

# ~/bin/layout - changes the screen layout with just one command
# armin | spill: consider it public domain. http://arminius.org


layouts=($HOME/.screenlayout/*.sh)
layouts_count="${#layouts[@]}"

if [[ ! -e $HOME/.screenlayout/current ]]; then
  current="1"
else
  current="$(cat $HOME/.screenlayout/current)"
fi

if [[ "$current" -eq "$layouts_count" ]]; then
  current="1"
else
  ((current+=1))
fi

echo "$current" > $HOME/.screenlayout/current
((current-=1))
echo "${layouts[$current]}"
notify-send "${layouts[$current]}"
bash "${layouts[$current]}"
