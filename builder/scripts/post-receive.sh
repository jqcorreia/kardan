#!/bin/sh

echo `pwd`
echo "[`date +"%Y-%m-%d %H:%M:%S"`] Building and exporting the D SDK..." >> $ROOT/builds.log
make -C $REPOSITORY_DIR export-builds >> $REPOSITORY_DIR/builds.log
echo "---\n" >> $REPOSITORY_DIR/builds.log
