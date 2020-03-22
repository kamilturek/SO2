#!/bin/bash

if [ $# -ne 3 ]; then
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

echo -n > $3

for file in $(cat $2); do
    if [ -f $file ]; then
        echo -e "$file\n" >> $3
        cat $file >> $3
    fi
done
