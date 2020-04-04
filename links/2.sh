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
    if [ -h $1/$file ] && [ $(dirname $(readlink -m $1/$file)) = $(realpath $1) ]; then
        rm $1/$file
    fi
done