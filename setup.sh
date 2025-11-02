#!/bin/bash

# Get the flavor of Unix we're working with
FLAVOR=$(uname -s)

if [ "$FLAVOR" = "Darwin" ]; then
  echo "Working on a Mac";
  mac/install-brew.sh;
  bash/install.sh
elif [ "$FLAVOR" = "Linux" ]; then
  echo "Working on Linux";
  bash/install.sh
else
  echo "This script only works on Linux or Mac, not $FLAVOR";
  exit 0;
fi

echo "symlinking gitconfig"
ln -sf $(pwd)/gitconfig "$HOME/.gitconfig"
