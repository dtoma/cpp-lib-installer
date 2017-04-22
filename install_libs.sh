#!/bin/bash

set -euo pipefail

INSTALL_PATH=$(pwd)/deps

function install_cmake {
  REPO_NAME="$1"
  cd "$REPO_NAME"
  if [ ! -f "CMakeLists.txt" ]; then
    echo "CMakeLists.txt not found"
    exit 1
  fi

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_PATH" ..
  make -j4 && make install
  cd ../../
}

function install_autotools {
  REPO_NAME="$1"
  cd "$REPO_NAME"
  if [ -f "bootstrap" ]; then
    ./bootstrap
  fi

  if [ -f "configure" ]; then
    ./configure --prefix="$INSTALL_PATH"
  fi

  make -j4
  make install
  cd ../../
}

while IFS=";" read -r org repo method version; do
    echo "install: $org/$repo $version $method"
    git clone https://github.com/"$org"/"$repo".git
    install_"$method" "$repo"
    rm -rf "$repo"
done < "$1"
