#!/bin/sh

echo "[`date +"%Y-%m-%d %H:%M:%S"`] Building and exporting the D SDK..." >> $ROOT/builds.log
make -C $ROOT export-builds >> $ROOT/builds.log
echo "---\n" >> $ROOT/builds.log
