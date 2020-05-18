#!/usr/bin/env python3

import os
import sys

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Invalid number of arguments')
        sys.exit(1)

    dirpath = os.path.abspath(sys.argv[1])

    if not os.path.isdir(dirpath):
        print(f'{dirpath}: does not exist or is not a directory')
        sys.exit(2)

    for filename in os.listdir(dirpath):
        filepath = os.path.join(dirpath, filename)
        if os.path.islink(filepath):
            target = os.path.join(os.path.dirname(filepath), os.readlink(filepath))
            target = os.path.normpath(target)
            if os.path.isfile(target) and not os.access(target, os.W_OK):
                os.remove(filepath)
                os.symlink(target, filepath)
