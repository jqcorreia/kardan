#!/bin/sh

# Git hooks are executed from `.git` directory.
ROOT=..

exec 2>&1
exec 1>>$ROOT/builds.log

echo "[`date +"%Y-%m-%d %H:%M:%S"`] Building and exporting the D SDK..."
make -C $ROOT export
echo "---\n"
