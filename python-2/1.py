#!/usr/bin/env python3

import os
import sys


if __name__ == '__main__':
    if len(sys.argv) != 4:
        print('Invalid number of arguments')
        sys.exit(1)

    dirpath = sys.argv[1]
    max_subdirs = int(sys.argv[2])
    min_subdirs = int(sys.argv[3])

    if not os.path.isdir(dirpath):
        print(f'{dirpath}: file does not exist or is not a directory')
        sys.exit(2)

    for root, *_ in os.walk(dirpath):
        nsubdirs = os.stat(root).st_nlink - 2
        if nsubdirs >= min_subdirs and nsubdirs < max_subdirs:
            print(root)
