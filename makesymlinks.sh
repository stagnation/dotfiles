#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#from https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

########## Variables

dir=~/dotfiles # dotfiles directory
olddir=~/bak_dotfiles # old dotfiles backup directory
files="gitconfig Xdefaults Xmodmap bash_profile vimrc tmux.conf gvimrc vimperatorrc ctags"
# list of files/folders to symlink in homedir

##########
# create bak_dotfiles homedir

echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files

for file in $files; do
echo "Moving any existing dotfiles from ~ to $olddir"
mv ~/.$file ~/$bakdir/
echo "Creating symlink to $file in home directory."
ln -s $dir/$file ~/.$file
done

echo "Moving existing i3 config from ~/.i3/config to $olddir"
mv ~/.i3/config ~/$bakdir/
echo "Creating symlink to i3/config in home directory."
ln -s $dir/i3cfg ~/.i3/config

echo "Creating symlink to .i3status.conf in home directory."
ln -s $dir/i3status.conf ~/.i3status.conf

echo "Creating symlink for fish functions in .config."
if [[ -s ~/.config/fish ]] ; then
    echo "directory exist, remove first to overwrite."
else
    ln -s $dir/fish ~/.config/fish
fi;

echo "Creating symlink for vimperator"
if [[ -s ~/.vimperator ]] ; then
    echo "directory exist, remove first to overwrite."
else
    ln -s $dir/vimperatorrc ~/.vimperatorrc
    mkdir ~/.vimperator/colors -p
    ln -s $dir/dorkness.vimp ~/.vimperator/colors/dorkness.vimp
fi;

echo "Creating symlink for i3pystatus from git to shadow pip ver"
if [[ -s ~/dotfiles/i3pystatus ]] ; then
    echo "directory exist, remove first to overwrite."
else
    ln -s /home/spill/bin/i3pystatus/i3pystatus $dir/i3pystatus
fi;


echo "Creating symlink for urxvt perls"
if [[ -s ~/.urxvt/ext/ ]] ; then
    echo "directory exist, remove first to overwrite."
else
    mkdir ~/.urxvt/ext -p
    ln -s ~/bin/gits/urxvt-perls ~/.urxvt/ext
fi;

echo "installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Creating vim directory structure"
mkdir ~/.vim/backup -p
mkdir ~/.vim/colors -p
mkdir ~/.config/nvim/backup -p
mkdir ~/.config/nvim/colors -p

echo "installing vim colorscheme"
cp $dir/vimcols/lakris.vim ~/.vim/colors/lakris.vim
cp $dir/vimcols/lakris256.vim ~/.vim/colors/lakris256.vim
cp $dir/vimcols/lakris.vim ~/.config/colors/lakris.vim
cp $dir/vimcols/lakris256.vim ~/.config/colors/lakris256.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

echo "Creating symlinks for ncmpcpp"
if [[ -s ~/.ncmpcpp ]] ; then
    echo "directory exist, remove first to overwrite."
else
    mkdir ~/.ncmpcpp
    ln -s $dir/ncmpconf ~/.ncmpcpp/config
    # ln -s $dir/ncmpkeys ~/.ncmpcpp/keys
    ln -s $dir/ncmpbinds ~/.ncmpcpp/bindings

fi;

ln -s $dir/mpv.conf ~/.config/mpv/mpv.conf
ln -s $dir/input.conf ~/.config/mpv/input.conf

echo "Cloning vimperator plugins to $dir"
cd $dir
git clone https://github.com/ervandew/vimperator-plugins


echo "Creating symlinks for mopidy"
ln -s $dir/mopidy.conf ~/.config/mopidy/
