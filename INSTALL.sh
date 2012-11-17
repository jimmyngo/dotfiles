#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo " done."

# change to the dotfiles directory
echo -n "Changing to the $dir directory..."
cd $dir
echo " done."

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in * ; do
    if [[ "$( basename -- $0 )" == "$file" ]]; then
	echo "Skipping this shell script: $( basename $0 )"
	continue
    fi

    if [[ -e $file && ! -L $file ]] ; then
        echo "Moving existing dotfile from ~/.$file to $olddir"
        mv ~/.$file ~/dotfiles_old/$file
    fi
    
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done