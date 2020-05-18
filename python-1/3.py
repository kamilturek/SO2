#!/usr/bin/env python3

import os
import sys


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Invalid number of arguments')
        sys.exit(1)

    linkpath = sys.argv[1]
    dirpath = os.path.abspath(sys.argv[2])

    if not os.path.islink(linkpath):
        print(f'{linkpath}: file does not exist or is not a symbolic link')
        sys.exit(2)

    if not os.path.isdir(dirpath):
        print(f'{dirpath}: file does not exist or is not a directory')
        sys.exit(3)

    target = os.readlink(linkpath)

    for root, dirs, files in os.walk(dirpath):
        for filepath in [os.path.join(root, filename) for filename in files + dirs]:
            if target in filepath:
                print('Symlink path exists in given directory tree.')
                break
    else:
        print('Symlink path does not exist in given directory tree.')
