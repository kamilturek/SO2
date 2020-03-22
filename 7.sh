#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

for file in $(ls -A $1); do
    if [ $1/$file != $1/$2 ] && [ ! -s $1/$file ] && [ -f $1/$file ]; then
        rm $1/$file
        echo "$1/$file" >> $1/$2
    fi
done
