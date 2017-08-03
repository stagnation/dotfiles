#!/bin/sh

sudo ls >/dev/null # force sudo authorization

# wait until display :1 exists
# exit with status 1 if display :1 exists
while $(w | awk '$3 == ":1" {ok = 1} END {exit ok}')
do
    sleep 1
done

content=$(xclip -o -selection clipboard)
echo "clipboard content: $content"
export XAUTHORITY=/home/games/.Xauthority
export DISPLAY=:1

echo "$content" | sudo xclip -i -selection clipboard
echo "$content" | sudo xclip -i -selection primary
