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
ln -s $dotfilesdir/fish $fishdir

vimperatordir=~/.vimperator
mkdir ~/.vimperator/colors -p
mv $vimperatordir $bakdir/
ln -s $dotfilesdir/vimperatorrc ~/.vimperatorrc
ln -s $dotfilesdir/dorkness.vimp $vimperatordir/colors/dorkness.vimp

urxvtperldir=~/.urxvt/ext
mkdir -p $urxvtperldir
ln -s ~/bin/gits/urxvt-perls $urxvtperdir

if [ ! -f ~/.vim/autoload/plug.vim ] ; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi;

if test ! -f ~/.tmux/plugins/tpm ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
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
# download swedish spelling file for neovim
wget ftp://ftp.vim.org/pub/vim/runtime/spell/sv.utf-8.spl -O ~/.local/share/nvim/site/spell/sv.utf-8.spl

mkdir ~/.ncmpcpp
ln -s $dotfilesdir/ncmpconf ~/.ncmpcpp/config
# ln -s $dotfilesdir/ncmpkeys ~/.ncmpcpp/keys
ln -s $dotfilesdir/ncmpbinds ~/.ncmpcpp/bindings

mpvdir=~/.config/mpv
mkdir -p $mpvdir
echo ">>copy mpv.conf manually!<<"
ln -s $dotfilesdir/input.conf $mpvdir/input.conf

mopdir=~/.config/mopidy
mkdir -p $mopdir
ln -s $dotfilesdir/mopidy.conf $mopdir/mopidy.conf

gitdir=~/.config/git
mkdir -p $gitdir
ln -s $dotfilesdir/gitconfigignore $gitdir/ignore

########
# Install scripts and programs
# some assembly might be required

# make in xcwd dir
ln -s $dotfilesdir/bin/gits/xcwd/xcwd ~/bin/

# install python modules for neovim
pip  install neovim
pip3 install neovim

# install python modules for statusbar
sudo pip3 install colour netifaces
sudo pip3 install git+https://github.com/enkore/i3pystatus.git
