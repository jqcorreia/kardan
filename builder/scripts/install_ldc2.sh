#!/bin/sh

echo "-- Downloading llvm..."
cd /tmp
curl -LO http://llvm.org/releases/3.3/clang+llvm-3.3-amd64-debian6.tar.bz2
tar xvf clang+llvm-3.3-amd64-debian6.tar.bz2

cd /src
echo "-- Downloading ldc2"
git clone --recursive https://github.com/ldc-developers/ldc
mkdir -p /src/ldc/build
cd /src/ldc/build
echo "-- Building ldc2..."
cmake .. \
    -DCMAKE_INSTALL_PREFIX=/d/ldc \
    -DLLVM_ROOT_DIR=/tmp/clang+llvm-3.3-amd64-debian6
make -j5
make install
echo "-- Installing ldc2..."
ln -s /d/ldc2/bin/ldc2 /d/bin/ldc2
ln -s /d/ldc2/bin/ldmd2 /d/bin/ldmd2


  

