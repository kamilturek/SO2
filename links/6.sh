#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

if [ ! -d $2 ]; then
    echo "$2: file does not exist or is not a directory"
    exit 1
fi

copy_dir() {
    # $1 - source directory
    # $2 - target directory

    for file in $(ls -A $1); do
        if [ -d $1/$file ]; then
            mkdir $2/$file
            copy_dir $1/$file $2/$file
        elif [ -h $1/$file ]; then
            ln -s $(readlink -m $1/$file) $2/$file
        elif [ -f $1/$file ]; then
            cp $1/$file $2/$file
        fi
    done
}

mkdir $2/$(basename $1)
copy_dir $1 $2/$(basename $1)