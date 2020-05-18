#!/bin/bash

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Invalid number of arguments"
    exit 1
fi

if [ $# -eq 2 ]; then
    N="$2"
else
    N=10
fi

find "$1" -printf "%p %s\n" | sort -k 2 -nr | cut -d " " -f 1 | head -n "$N"
