#!/bin/sh

urxvt -name UrxvtFloat    \
    -e sh -c "listbins.sh \
        | fzf --reverse             \
        | xargs start_independent_process.py" 2>/dev/null
