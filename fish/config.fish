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

if which rustc >/dev/null
    set RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
end

set -x LC_ALL "en_US.UTF-8"
set -x LANGUAGE "en_US.UTF-8"
set -x LC_TIME "sv_SE.UTF-8"

set -x fish_prompt_pwd_dir_length 3
set -x EDITOR vim

source ~/dotfiles/fish/(uname -n).fish
source ~/dotfiles/fish/alias.fish
