#!/bin/sh

echo "[`date +"%Y-%m-%d %H:%M:%S"`] Building and exporting the D SDK..."
make -C $REPOSITORY_DIR export
echo "---\n"
