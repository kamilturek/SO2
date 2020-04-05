#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

changed=1

while [ $changed -eq 1 ]; do
    changed=0
    for i in $(ls -A $1); do
        for j in $(ls -A $1); do
            if [ $1/$i != $1/$j ]; then
                if [ ! -h $1/$i ] && [ ! -h $1/$j ] && [ $1/$i -ef $1/$j ]; then
                    ln -fs $(realpath $1/$i) $1/$j
                    changed=1
                    break 2
                fi
            fi
        done
    done
done
