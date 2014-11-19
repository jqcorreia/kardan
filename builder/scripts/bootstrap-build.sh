#!/bin/sh

if [ ! -d "$ROOT/.git" ]
then
   echo "[kardan-builder] ** Kardan root directory is not set."
   echo "[kardan-builder] -- Check if the post-receive hook is present."
   exit 2
fi

# Ensure the dir tree is ok.
mkdir -p $ROOT/log
mkdir -p $ROOT/builds

# Redirect std{out,err} to log files.
NOWTS=`date +%s`
exec 1> $ROOT/log/build-$NOWTS-stdout.log
exec 2> $ROOT/log/build-$NOWTS-stderr.log

# Build and export the sdk.
make -C $ROOT build
make -C $ROOT export

