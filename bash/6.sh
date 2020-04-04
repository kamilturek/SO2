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
    if [ -f $1/$file ] && [ -x $1/$file ]; then
        mv $1/$file $2/$file
    fi
done
