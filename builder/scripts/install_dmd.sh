#!/bin/sh

echo "-- Downloading dmd sources..."
cd /src
git clone https://github.com/D-Programming-Language/dmd
cd /src/dmd/src
echo "-- Building dmd..."
make -f posix.mak -j5 MODEL=64
echo "-- Installing dmd..."
cp /src/dmd/src/dmd /d/dmd/bin/dmd
ln -s /d/dmd/bin/dmd /d/bin/dmd
echo "Configuring dmd..."
cat > /etc/dmd.conf << __EOF__
[Environment]
DFLAGS=-I/d/include/dmd -L-L/d/lib/dmd -L--no-warn-search-mismatch -L--export-dynamic
__EOF__

