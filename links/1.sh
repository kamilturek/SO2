#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -h $1 ]; then
    echo "$1: file does not exist or is not a symbolic link"
    exit 1
fi

if [ ! -e $2 ]; then
    echo "$2: file does not exist"
    exit 1
fi

if [ $(readlink -e $1) = $(realpath $2) ]; then
    echo "TRUE"
else
    echo "FALSE"
fi
