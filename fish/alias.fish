function grep
    command grep --exclude-dir=.git --color $argv
end

function naelv
    urxvt -e sh -c "mosh aelv" &
end

function cd..
    cd ..
end

function xclipin
    xclip -i -selection clipboard
end

function gitclone
    git clone (xclip -o)
end

function vim
    if which nvim >/dev/null
        nvim $argv
    else
        vim $argv
    end
end
