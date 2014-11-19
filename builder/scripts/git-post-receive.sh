#!/bin/sh

# Git hooks are executed from `.git` directory.
ROOT=..

# Redirect std{out,err} to log files.
exec 1> $ROOT/log/build-`date +%s`-stdout.log
exec 2> $ROOT/log/build-`date +%s`-stderr.log

# Build and export the sdk.
make -C $ROOT build
make -C $ROOT export


# Place this in .git/hook/post-receive
# ---
# #!/bin/bash

# echo "[kardan-builder] Will build and export the SDK..."
# exec $GIT_DIR/../builder/scripts/git-post-receive.sh >&- 2>&- & 
# ---
