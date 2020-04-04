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
    if [ -d $1/$file ]; then
        for nested_file in $(ls -A $1/$file); do
            mv $1/$file/$nested_file $1
        done
        rmdir $1/$file
    fi
done
