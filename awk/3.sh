#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "$1: file does not exist or is not a regular file"
    exit 1
fi

awk '{ print gensub(/([0-9][1-9])\.([0-9][1-9])\.[1-2][0-9]([0-9]{2})/, "\\3/\\2/\\1", "g") }' < "$1"
