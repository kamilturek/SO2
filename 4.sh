#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

N=1
for file in $(ls -AS $1); do
    if [ -f $1/$file ]; then
        mv $1/$file $1/${file}.$N
        N=$((N+1))
    fi
done
