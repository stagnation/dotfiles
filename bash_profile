#http://blog.sanctum.geek.nz/prompt-directory-shortening/
PS1_PWD_MAX=15
__pwd_ps1() { echo -n $PWD | sed -e "s|${HOME}|~|" -e "s|\(/[^/]*/\).*\(/.\{${PS1_PWD_MAX}\}\)|\1...\2|"; }

GIT_PS1_SHOWDIRTYSTATE=1
PS1='\[\033[01;34m\]$(__pwd_ps1)$(__git_ps1 " \[\033[01;31m\](%s)")$\[\033[00m\] '

#turn flow control off
stty -ixon

#path variable
#vim "$acnd"/httpd.confO

#tolerate typos
#in cd commands
shopt -s cdspell

#ignore git dir in grep
alias grep='grep --exclude-dir=.git'
#quake 3 cpma alias
alias cpma='quake3 +set fs_game cpma'

function lsext()
{
find . -type f -iname '*.'${1}'' -exec ls -l --color=auto {} \; ;
}

function streambest()
{
livestreamer ${1} best &
}

function mkcd()
{
mkdir ${1}; cd ${1}
}

function streamclip()
{
livestreamer $(xclip -o) best &
}

function ytclip()
{
youtube-viewer $(xclip -o) best -q --no-interactive &
}

function mkpy()
{
cp ~/arbete/resources/python/stub.py ./${1}
vim ./${1}
}

function streamtest()
{
if livestreamer $(xclip -o) best -Q & > /dev/null; then
    printf 'livestreamer ok\n' >&2
else
    printf 'livestreamer not ok' >&2
    youtube-viewer $(xclip -o) best -q & > /dev/null &
fi
}

#vi(m) mode for bash, rathr than emacs
set -o vi
