# cpp-lib-installer

Install C/C++ libraries from source.

This script assumes it is started from the project root, and that a `deps` directory is present.

Tested:

```
# cmake

sh cmake_install.sh philsquared Catch cmake
sh cmake_install.sh nlohmann json cmake
sh cmake_install.sh fmtlib fmt cmake
sh cmake_install.sh Microsoft GSL cmake

# autotools

sh cmake_install.sh quickfix quickfix autotools
sh cmake_install.sh google leveldb autotools # doesn't work, no install rule
sh cmake_install.sh google googletest cmake
```
