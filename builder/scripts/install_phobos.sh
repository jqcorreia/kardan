#!/bin/sh

export DMD=/d/bin/dmd

echo "-- Downloading phobos..."
cd /src
git clone https://github.com/D-Programming-Language/phobos
cd /src/phobos
echo "-- Building phobos..."
make -f posix.mak -j5 MODEL=64
echo "-- Installing phobos..."
cp /src/phobos/generated/linux/release/64/libphobos2.a /d/dmd/lib
cp -r /src/phobos/std /d/dmd/include
cp -r /src/phobos/etc /d/dmd/include

