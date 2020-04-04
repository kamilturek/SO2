#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

if [ ! -f $2 ]; then
    echo "$2: file does not exist or is not a regular file"
    exit 1
fi

for file in $(cat $2); do
    touch $1/$file
done
