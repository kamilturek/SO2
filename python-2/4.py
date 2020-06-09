#!/usr/bin/env python3

import os
import sys
import time


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Invalid number of arguments')
        sys.exit(1)

    dirpath = sys.argv[1]
    timestamp = time.time()

    if not os.path.isdir(dirpath):
        print(f'{dirpath}: file does not exist or is not a directory')
        sys.exit(2)

    for root, _, files in os.walk(dirpath):
        for filename in files:
            filepath = os.path.join(root, filename)
            if os.path.islink(filepath):
                mtime = os.lstat(filepath).st_mtime
                time_diff = timestamp - mtime
                if time_diff >= 0 and time_diff <= 300:
                    print(filepath)
