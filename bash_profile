#http://blog.sanctum.geek.nz/prompt-directory-shortening/
PS1_PWD_MAX=15
__pwd_ps1() { echo -n $PWD | sed -e "s|${HOME}|~|" -e "s|\(/[^/]*/\).*\(/.\{${PS1_PWD_MAX}\}\)|\1...\2|"; }

GIT_PS1_SHOWDIRTYSTATE=1
PS1='\[\033[01;34m\]$(__pwd_ps1)$(__git_ps1 " \[\033[01;31m\](%s)")$\[\033[00m\] '


#set swedish mac keyboard mapping
setxkbmap -layout se -variant mac -option ctrl:nocaps

#turn flow control off
stty -ixon

#add local clang dir to path variable
export PATH=~/arbete/resources/clang/clang+llvm-3.6.0-x86_64-linux-gnu/bin/:$PATH

#vim "$acnd"/httpd.confO

#tolerate typos
#in cd commands
shopt -s cdspell

#ignore git dir in grep
alias grep='grep --exclude-dir=.git --color'

alias naelv='urxvt -e sh -c "mosh aelv -- screen -dr" &'

alias xclipin='xclip -i -selection clipboard'

alias gitclone='git clone $(xclip -o)'

#to remove function:
#unset -f <functionname>
#
#
#basic calculator syntax - function
=() {
    calc="${@//p/+}"
    calc="${calc//x/*}"
    bc -l <<<"scale=10;$calc"
}

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
#if [ ${1} != '' ] ; then
if [ ${1}  ] ; then
mkdir ${1}; cd ${1}
echo $(pwd)
fi
}

function mvcd()
{
echo $#
if [ $# == 2 ] ; then
mv ${1} ${2}; cd ${2}
echo $(pwd)
else
echo "need two arguments"
fi
}

function copyfile()
{
cat ${1} | xclip -i -selection clipboard
}

function streamclip()
{
livestreamer $(xclip -o) best &
}

function ytclip()
{
youtube-viewer $(xclip -o) best -q --no-interactive &
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

#change fileformat completetion for vim:
#BACKUP
#$complete -p vim
#complete -F _filedir_xspec vim
complete -f -X '*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class|pdf)' vim
# this is default taken  from: http://anonscm.debian.org/gitweb/?p=bash-completion/bash-completion.git;a=blob;f=bash_completion;h=c684a8fd9ded8b79b3ecbbbe30728679dbded276;hb=e777395ac3ce25527e58e04bfc406ae03bdb3b12#l1821
# but with addition of pdf
complete -f -X '*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class|pdf)' vtex

#load .Xmodmap for prtscr -> alt gr
xmodmap ~/.Xmodmap
