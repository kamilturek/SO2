#!/usr/bin/env python3

import os
import sys


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Invalid number of arguments')
        sys.exit(1)

    dirpath = sys.argv[1]

    if not os.path.isdir(dirpath):
        print(f'{dirpath}: file does not exist or is not a directory')
        sys.exit(2)

    for root, _, files in os.walk(dirpath):
        for filename in files:
            filepath = os.path.join(root, filename)
            if os.path.islink(filepath):
                target = os.path.realpath(filepath)
                for nroot, _, nfiles in os.walk(os.path.dirname(filepath)):
                    nfilepaths = [os.path.join(nroot, nfilename) for nfilename in nfiles]
                    nfilepaths = [os.path.normpath(path) for path in nfilepaths]
                    nfilepaths = [nfilepath for nfilepath in nfilepaths if not os.path.islink(nfilepath)]
                    for path in nfilepaths:
                        if os.path.samefile(target, path):
                            print(filepath)
