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

set PATH /home/spill/bin $PATH
set PATH /home/spill/.cargo/bin $PATH
set MPD_HOST 192.168.1.8
set fish_greeting
set RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

source ~/dotfiles/fish/(uname -n).fish
