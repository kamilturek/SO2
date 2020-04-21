#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

if [ ! -d "$2" ]; then
    echo "$2: file does not exist or is not a directory"
    exit 1
fi

mkdir -p "$3"

find "$1" -printf "%P\n" | while read -r file; do
    if [ -e "$2/$file" ]; then
        if { [ -f "$1/$file" ] && [ -f "$2/$file" ]; } || { [ -h "$1/$file" ] && [ -h "$2/$file" ]; }; then
            cp -P "$1/$file" "$3/$file"
        elif [ -d "$1/$file" ] && [ -d "$2/$file" ]; then
            mkdir -p "$3/$file"
        fi
    fi
done
