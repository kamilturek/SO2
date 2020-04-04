#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

for file in $(ls -A $1); do
    if [ -f $1/$file ] && [ -w $1/$file ]; then
        echo $file
        echo
        cat $1/$file
        echo
    fi
done
