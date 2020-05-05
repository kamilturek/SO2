#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1: file does not exist or is not a directory"
    exit 1
fi

find "$1" -type f | awk -F '/' '{
    filename = $NF
    ext_pos = match(filename, /\.\w*$/)

    if (ext_pos != 0) {
        ext = substr(filename, ext_pos)
        filename = substr(filename, 0, ext_pos - 1)
    } else {
        ext = ""
    }

    if (match(ext, /[A-Z]/) == 0 &&
        match(substr(filename, 0, 1), /[A-Z]/) == 0 &&
        match(substr(filename, length(filename), 1), /[A-Z]/) == 0) {
        gsub(/[A-Z]/, "_&", filename);
        filename = tolower(filename)
    }

    for (i = 1; i < NF; i++)
        printf "%s/", $i;

    print filename ext
}   
'