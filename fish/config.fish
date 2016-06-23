function tmux_attach
	tmux has-session -t remote
	and tmux attach-session -t remote
end

function tmux_new_session
	bash ~/bin/createtmuxsession.sh
end

if status --is-login
	tmux_attach
	or tmux_new_session
	or echo "tmux failed to start; plain shelll"
end

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


set PATH /home/spill/.local/bin $PATH
set PATH /home/spill/bin $PATH
set MPD_HOST 192.168.1.8
set fish_greeting
xmodmap ~/.xmodmap
