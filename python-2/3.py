#!/usr/bin/env python3

import os
import stat
import sys


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Invalid number of arguments')
        sys.exit(1)

    dirpath = sys.argv[1]

    if not os.path.isdir(dirpath):
        print(f'{dirpath}: file does not exist or is not a directory')
        sys.exit(2)

    for root, dirs, _ in os.walk(dirpath):
        for subdir in dirs:
            subpath = os.path.join(root, subdir)
            mod = os.stat(subpath).st_mode
            if (mod & ~stat.S_IRUSR or mod & ~stat.S_IXUSR) and \
               (mod & stat.S_IWGRP or mod & stat.S_IWOTH):
                print(subpath)
