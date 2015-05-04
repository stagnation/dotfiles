function tmux_attach
	tmux has-session -t remote
	and tmux attach-session -t remote
end

function tmux_new_session
	bash ~/bin/createtmuxsession.sh
    tmux attach
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

if status --is-not-login
    xmodmap ~/.xmodmap
end
