#!/bin/bash
# Build script

echo "Get a list of all the .cpp files."
# Get a list of all the .cpp files.
cppFilenames=$(find . -type f -name "*.cpp")

echo "Files:" $cppFilenames

assembly="emlua"
compilerFlags="--std=c++20 -g -Wall -Werror -pedantic"
optimiseFlag="-O3"
# -Wall -Werror
includeFlags="-Isrc -I$LUA_DIR/include"
linkerFlags="-L$LUA_DIR -llua54.lib"

echo "Building $assembly..."
clang $cppFilenames $compilerFlags $optimiseFlag -o ./bin/$assembly.exe $includeFlags $linkerFlags
