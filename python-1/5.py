#!/usr/bin/env python3

import os
import shutil
import sys

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Invalid number of arguments')
        sys.exit(1)

    src = os.path.abspath(os.path.normpath(sys.argv[1]))
    dest = os.path.abspath(os.path.normpath(sys.argv[2]))

    if not os.path.isdir(src):
        print(f'{src}: file does not exist or is not a directory')
        sys.exit(2)

    if os.path.exists(dest):
        print(f'{dest}: file already exists')
        sys.exit(3)

    os.mkdir(dest)

    for filename in os.listdir(src):
        srcpath = os.path.join(src, filename)
        destpath = os.path.join(dest, filename)

        if os.path.islink(srcpath):
            target = os.path.join(os.path.dirname(srcpath), os.readlink(srcpath))
            target = os.path.normpath(target)
            if os.path.dirname(target) == src:
                os.symlink(os.path.basename(os.readlink(srcpath)), destpath)
            else:
                os.symlink(target, destpath)
        elif os.path.isdir(srcpath):
            os.mkdir(destpath)
        elif os.path.isfile(srcpath):
            shutil.copyfile(srcpath, destpath)
