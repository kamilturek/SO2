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

for file in $(ls -A $1); do
    if [ -f $1/$file ] && [ ! -h $1/$file ]; then
        cp $1/$file $2/$file
    elif [ -h $1/$file ]; then
        if [ $(dirname $(readlink -m $1/$file)) = $(realpath $1) ]; then
            ln -s $(basename $(readlink $1/$file)) $2/$file
        else
            ln -s $(readlink -m $1/$file) $2/$file
        fi
    fi
done
