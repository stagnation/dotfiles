function naelv
    urxvt -e sh -c "mosh aelv -- screen -dr" &
end

function xclipin
    xclip -i -selection clipboard
end

function gitclone
    git clone (xclip -o)
end

function pstime
    ps -eo "%p %y %t %c"
end

if status --is-login
	sh ~/dotfiles/bin/createtmuxsession
end

set PATH /home/spill/.local/bin $PATH
set PATH /home/spill/bin $PATH
set MPD_HOST 192.168.1.8
set fish_greeting
xmodmap ~/.xmodmap
