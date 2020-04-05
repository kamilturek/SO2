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

if [ $(realpath $1) = $(realpath $2) ]; then
    echo "Arguments are the same file"
    exit 1
fi

for i in $(ls -A $1); do
    for j in $(ls -A $2); do
        if [ $1/$i -ef $2/$j ]; then
            ln -fs $(realpath $1/$i) $2/$j
        fi
    done
done
