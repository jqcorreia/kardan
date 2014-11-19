#!/bin/sh

apt-get -y update
apt-get -y install --no-install-recommends \
    curl \
    git \
    build-essential \
    libconfig-dev \
    cmake \
    ca-certificates
git config --global url."https://github".insteadOf git://github
mkdir -p \
    /src \
    /export \
    /d/bin \
    /d/dmd/lib \
    /d/dmd/bin \
    /d/dmd/etc \
    /d/dmd/include \
    /d/ldc2/lib \
    /d/ldc2/bin \
    /d/ldc2/etc \
    /d/ldc2/include

