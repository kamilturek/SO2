#!/usr/bin/env python3

import os
import stat
import sys


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Invalid number of arguments')
        sys.exit(1)

    dirpath = sys.argv[1]
    filepath = sys.argv[2]

    if not os.path.isdir(dirpath):
        print(f'{dirpath}: file does not exist or is not a directory')
        sys.exit(2)

    if not os.path.isfile(filepath):
        print(f'{filepath}: file does not exist or is not a regular file')
        sys.exit(3)

    with open(filepath) as files_list:
        for filename in files_list:
            filename = filename.strip('\n')
            filepath = os.path.join(dirpath, filename)

            if os.path.exists(filepath):
                if os.path.isfile(filepath) and not os.path.islink(filepath):
                    os.chmod(filepath, stat.S_IRUSR | stat.S_IRGRP | stat.S_IROTH)
                else:
                    print(f'{filename}: file already exists and is not a regular file')
            else:
                os.mknod(filepath)
