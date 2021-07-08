import os
import sys

from robot.api.deco import keyword

ROOT_DIR_DEPTH = 1
path = os.path.dirname(os.path.abspath(__file__))

for i in range(ROOT_DIR_DEPTH):
    path = os.path.join(path, os.pardir)

if path not in sys.path:
    sys.path.insert(0, path)

@keyword
def keyword():
    pass

