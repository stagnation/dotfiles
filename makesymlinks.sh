#!/bin/sh
########## Variables

dotfilesdir=~/dotfiles # dotfiles directory
bakdir=~/bak_dotfiles # old dotfiles backup directory
files="gitconfig Xdefaults Xmodmap bash_profile vimrc tmux.conf gvimrc vimperatorrc ctags i3status.conf taskrc"
# list of files/folders to symlink in homedir

##########

mkdir -p $bakdir

cd $dotfilesdir
for file in $files; do
    if [ -f $file ] ; then
        mv ~/.$file $bakdir/
    fi

    ln -s $dotfilesdir/$file ~/.$file
done

i3dir=~/.i3
mkdir -p $i3dir
mv $i3dir/config $bakdir/
ln -s $dotfilesdir/i3cfg $i3dir/config

sshdir=~/.ssh
mkdir -p $sshdir
ln -s $dotfilesdir/ssh_config $sshdir/config

fishdir=~/.config/fish
mv $fishdir $bakdir/
ln -s $dotfilesdir/fish ~/.config/fish

vimperatordir=~/.vimperator
mkdir ~/.vimperator/colors -p
mv $vimperatordir $bakdir/
ln -s $dotfilesdir/vimperatorrc ~/.vimperatorrc
ln -s $dotfilesdir/dorkness.vimp $vimperatordir/colors/dorkness.vimp

urxvtperldir=~/.urxvt/ext
mkdir -p $urxvtperldir
ln -s ~/bin/gits/urxvt-perls ~/.urxvt/ext

if [ ! -f ~/.vim/autoload/plug.vim ] ; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi;

mkdir -p ~/.vim/backup
mkdir -p ~/.vim/colors
mkdir -p ~/.config/nvim/backup
mkdir -p ~/.config/nvim/colors

schemes="lakris.vim lakris256.vim"
for scheme in $schemes; do
    ln -s $dotfilesdir/vimcols/$scheme ~/.vim/colors/$scheme
    ln -s $dotfilesdir/vimcols/$scheme ~/.config/nvim/colors/$scheme
done ;

echo "source ~/.vimrc" > ~/.config/nvim/init.vim

mkdir ~/.ncmpcpp
ln -s $dotfilesdir/ncmpconf ~/.ncmpcpp/config
# ln -s $dotfilesdir/ncmpkeys ~/.ncmpcpp/keys
ln -s $dotfilesdir/ncmpbinds ~/.ncmpcpp/bindings

mpvdir=~/.config/mpv
mkdir -p mpvdir
echo ">>copy mpv.conf manually!<<"
ln -s $dotfilesdir/input.conf $mpvdir/input.conf

mopdir=~/.config/mopidy
mkdir -p mopdir
ln -s $dotfilesdir/mopidy.conf $mopdir/mopidy.conf

ln -s $dotfilesdir/gitconfigignore ~/.config/git/ignore
