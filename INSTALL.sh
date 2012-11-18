#!/bin/bash
##############################################################################################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles #
##############################################################################################

dir=~/dotfiles
olddir=~/.backup_dotfiles

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo " done."

# change to the dotfiles directory
echo -n "Changing to the $dir directory..."
cd $dir
echo " done."

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in *; do
    if [[ "$(basename -- $0)" == "$file" ]]; then
	echo "Skipping this shell script: $( basename $0 )"
	continue
    fi

    if [[ -L ~/.$file ]]; then
	echo "~/.$file is already a symlink. Skipping."
	continue
    elif [[ -e ~/.$file ]]; then
	echo "$/.$file already exists, moving it to backup dir."
        mv ~/.$file ~/dotfiles_old/$file
    fi
    
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file

done