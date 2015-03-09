#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#from https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

########## Variables

dir=~/dotfiles # dotfiles directory
olddir=~/bak_dotfiles# old dotfiles backup directory
files="Xdefaults Xmodmap bash_profile vimrc.after tmux.conf vimrc.before gvimrc vimperatorrc"
# list of files/folders to symlink in homedir

##########
# create dotfiles_old in homedir

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
mv ~/.$file ~/dotfiles_old/
echo "Creating symlink to $file in home directory."
ln -s $dir/$file ~/.$file

echo "Moving any existing dotfiles from ~ to $olddir"
mv ~/.i3/config ~/dotfiles_old/
echo "Creating symlink to i3/config in home directory."
ln -s $dir/i3cfg ~/.i3/config

done
