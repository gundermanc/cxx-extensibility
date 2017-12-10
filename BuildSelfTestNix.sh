#!/bin/bash

# Cross Platform Tools for C/C++ Extensible Applications
# By: Christian Gunderman

git submodule init
git submodule update


# StABIlize build + test
cd StABIlize
cmake .
make
./StABIlize-Tests

# Kill build if test fails.
if [[ $? != 0 ]]; then
   exit 1
fi
cd ..
