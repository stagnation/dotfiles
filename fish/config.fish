function naelv
    urxvt -e sh -c "mosh aelv -- screen -dr" &
end

function xclipin
    xclip -i -selection clipboard
end

function gitclone
    git clone (xclip -o)
end

xmodmap ~/.xmodmap
