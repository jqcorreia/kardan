#!/bin/sh

export DC=/d/bin/dmd

echo "-- Downloading dub..."
cd /src
git clone https://github.com/D-Programming-Language/dub
cd /src/dub
echo "-- Building dub..."
./build.sh
echo "-- Installing dub..."
cd /d/bin
ln -s /src/dub/bin/dub

