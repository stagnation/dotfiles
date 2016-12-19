#!/bin/sh
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#from https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

########## Variables

dir=~/dotfiles # dotfiles directory
bakdir=~/bak_dotfiles # old dotfiles backup directory
files="gitconfig Xdefaults Xmodmap bash_profile vimrc tmux.conf gvimrc vimperatorrc ctags i3status.conf"
# list of files/folders to symlink in homedir

##########
# create bak_dotfiles homedir

echo -n "  Creating $bakdir for backup of any existing dotfiles in ~ ..."
mkdir -p $bakdir
echo "  done"

# change to the dotfiles directory

echo -n "  Changing to the $dir directory ..."
cd $dir
echo "  done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files

echo "  Moving any existing dotfiles from ~ to $bakdir"
for file in $files; do
    if [ -f $file ] ; then
        mv ~/.$file $bakdir/
    fi
    echo "  Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

i3dir=~/.i3
if [ -d $i3dir ] ; then
    echo "  Moving existing i3 config from $i3dir/config to $bakdir"
    mv $i3dir/config $bakdir/
    echo "  Creating symlink to i3/config in home directory."
    ln -s $dir/i3cfg $i3dir/config
fi

fishdir=~/.config/fish
echo "  Creating symlink for fish functions in .config."
if [ -d ~/.config/fish ] ; then
    echo "directory exist, remove first to overwrite."
else
    ln -s $dir/fish ~/.config/fish
fi;

echo "  Creating symlink for vimperator"
if [ -d ~/.vimperator ] ; then
    echo "directory exist, remove first to overwrite."
else
    ln -s $dir/vimperatorrc ~/.vimperatorrc
    mkdir ~/.vimperator/colors -p
    ln -s $dir/dorkness.vimp ~/.vimperator/colors/dorkness.vimp
fi;
# echo "Cloning vimperator plugins to $dir"
# cd $dir
# git clone https://github.com/ervandew/vimperator-plugins

echo "  Creating symlink for i3pystatus from git to shadow pip ver"
if [ -d ~/dotfiles/i3pystatus ] ; then
    echo "directory exist, remove first to overwrite."
else
    ln -s /home/spill/bin/i3pystatus/i3pystatus $dir/i3pystatus
fi;

echo "  Creating symlink for urxvt perls"
if [ -d ~/.urxvt/ext/ ] ; then
    echo "directory exist, remove first to overwrite."
else
    mkdir ~/.urxvt/ext -p
    ln -s ~/bin/gits/urxvt-perls ~/.urxvt/ext
fi;

if [ ! -f ~/.vim/autoload/plug.vim ] ; then
    echo "  installing vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi;

echo "  Creating vim directory structure"
mkdir ~/.vim/backup -p
mkdir ~/.vim/colors -p
mkdir ~/.config/nvim/backup -p
mkdir ~/.config/nvim/colors -p

echo "  installing vim colorscheme"
schemes="lakris.vim lakris256.vim"
for scheme in $schemes; do
    ln -s $dir/vimcols/$scheme ~/.vim/colors/$scheme
    ln -s $dir/vimcols/$scheme ~/.config/nvim/colors/$scheme
done ;
echo "source ~/.vimrc" > ~/.config/nvim/init.vim

echo "  Creating symlinks for ncmpcpp"
if [ -f ~/.ncmpcpp ] ; then
    echo "directory exist, remove first to overwrite."
else
    mkdir ~/.ncmpcpp
    ln -s $dir/ncmpconf ~/.ncmpcpp/config
    # ln -s $dir/ncmpkeys ~/.ncmpcpp/keys
    ln -s $dir/ncmpbinds ~/.ncmpcpp/bindings

fi;

echo "Cloning vimperator plugins to $dir"
cd $dir
git clone https://github.com/ervandew/vimperator-plugins

mpvdir=~/.config/mpv
if [ -d $mpvdir ] ; then
    echo "  Creating symlinks for mpv"
    echo ">>copy mpv.conf manually!<<"
    ln -s $dir/input.conf $mpvdir/input.conf
fi;

mopdir=~/.config/mopidy
if [ -d $mopdir ] ; then
    echo "  Creating symlinks for mopidy"
    ln -s $dir/mopidy.conf $mopdir/mopidy.conf
fi ;

echo "  Global git ignore"
ln -s $dir/gitconfigignore ~/.config/git/ignore
