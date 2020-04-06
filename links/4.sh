#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

for i in $(ls -A $1); do
    for j in $(ls -A $1); do
        if [ $1/$i != $1/$j ] && [ $1/$i -ef $1/$j ]; then
            if [ -f $1/$i ] && [ ! -h $1/$i ] && [ ! -h $1/$j ]; then
                ln -fs $(realpath $1/$i) $1/$j
            fi
        fi
    done
done
