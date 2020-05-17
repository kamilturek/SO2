#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

if [ ! -e "$2" ]; then
    echo "$2: file does not exist"
    exit 1
fi

find -L "$1" -samefile "$2"