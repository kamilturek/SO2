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

for file1 in $(ls -A $1); do
    for file2 in $(cat $2); do
        if [ $file1 = $file2 ]; then
            continue 2
        fi
    done
    echo $file1
done

for file2 in $(cat $2); do
    for file1 in $(ls -A $1); do
        if [ $file1 = $file2 ]; then
            continue 2
        fi
    done
    echo $file2
done
