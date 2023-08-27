#!/bin/bash

cd $HOME/dotfiles
source $HOME/dotfiles/util_fns.sh

files2back=(".bashrc" ".bash_profile" ".profile")
backupFiles files2back

allDirs=$(find . -type d -not -path './.git/*' -not -path '.' -not -path './.git' -not -path './.gnupg')
createDirs allDirs

allFiles=$(find . -type f -not -path './.git/*')
excludedFiles=("./README.md" "./.gitignore" "./colors.txt" "./util_fns.sh")
totalFiles=0
for f in $allFiles
do
    totalFiles=$((totalFiles + 1))
    check=$(fileCheck excludedFiles $f)
    if [ "$check" == "NOT IN" ]
    then
        file=$(stripFirstTwo $f)
        path="$HOME/$file"
        if [ -h $path ]
        # -h Returns true if file exists and is a symlink
        then
            rm $path
            ln -s ~/dotfiles/$file $path
            totalLinked=$((totalLinked + 1))
        elif [ -f $path ]
        # Returns true if file exits but it is not symlinked
        then
            echo "Exists: $path exists!"
            echo "Need to erase or backup"
        else
            ln -s ~/dotfiles/$file $path
            totalLinked=$((totalLinked + 1))
        fi
    fi
done
totalFiles=$((totalFiles - ${#excludedFiles[@]}))
if [ $totalLinked -eq $totalFiles ]
then
    echo "ALL LINKED"
fi
