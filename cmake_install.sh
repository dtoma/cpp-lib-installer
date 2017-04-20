#!/bin/bash

set -euox pipefail

ORG_NAME="$1"
REPO_NAME="$2"
INSTALL_METHOD="$3"
INSTALL_PATH=$(pwd)/deps

function install_cmake {
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

git clone https://github.com/"$ORG_NAME"/"$REPO_NAME".git
install_"$INSTALL_METHOD"
rm -rf "$REPO_NAME"
