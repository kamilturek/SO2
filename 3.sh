#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

for file in $(ls -A $1); do
    if [ ! -x $1/$file ]; then
        if [ -d $1/$file ] && [ -z "$(ls -A $file)" ]; then
            rmdir $1/$file
        elif [ -f $1/$file ]; then
            rm $1/$file
        fi
    fi
done
