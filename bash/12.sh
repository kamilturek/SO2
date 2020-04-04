#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

regulars=0
directories=0
for file in $(ls -A $1); do
    if [ -x $1/$file ]; then
        if [ -f $1/$file ]; then
            regulars=$((regulars + 1))
        elif [ -d $1/$file ]; then
            directories=$((directories + 1))
        fi
    fi
done

echo $regulars $directories
