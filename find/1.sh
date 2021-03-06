#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

find "$1" -type d ! -perm -500 -perm /022 -print