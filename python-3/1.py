#!/usr/bin/env python3

import os
import re
import sys


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Invalid number of arguments')
        sys.exit(1)

    filepath = sys.argv[1]

    if not os.path.isfile(filepath):
        print(f'{filepath}: file does not exist or is not a regular file')
        sys.exit(2)

    with open(filepath) as fi:
        for match in re.findall(r'\b(?:0|[1-9][0-9]*)\.(?:0|[0-9]*[1-9])\b', fi.read()):
            print(match)
