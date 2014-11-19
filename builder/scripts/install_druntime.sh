#!/bin/sh

export DMD=/d/bin/dmd

echo "-- Downloading druntime..."
cd /src
git clone https://github.com/D-Programming-Language/druntime
cd /src/druntime
echo "-- Building druntime..."
make -f posix.mak -j5 MODEL=64
echo "-- Installing druntime..."
cp -r /src/druntime/import/* /d/dmd/include

