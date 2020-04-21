#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

mkdir -p "$2"

find "$1" -printf "%P\n" | while read -r file; do
    if [ -h "$1/$file" ]; then
        ln -fs "$(readlink -e "$1/$file")" "$2/$file"
    elif [ -d "$1/$file" ]; then
        mkdir -p "$2/$file"
    elif [ -f "$1/$file" ]; then
        cp "$1/$file" "$2/$file"
    fi
done