#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "$1: file does not exist or is not a regular file"
    exit 1
fi

awk -F '.' '
    /^[0-9]{2}\.[0-9]{2}\.[0-9]{4}$/ {
        if (match($1, /^0/) != 0)
            $1 = substr($1, 2, 1)

        if (match($2, /^0/) != 0)
            $2 = substr($2, 2, 1)
        
        $3 = substr($3, 3, 2)

        print $3"/"$2"/"$1
    }
' < "$1"