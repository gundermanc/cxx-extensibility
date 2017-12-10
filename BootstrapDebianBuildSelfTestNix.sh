#!/bin/bash

# Cross Platform Tools for C/C++ Extensible Applications
# By: Christian Gunderman

echo "Installing build prereq packages..."
sudo apt-get install build-essential git cmake

./BuildSelfTestNix.sh
