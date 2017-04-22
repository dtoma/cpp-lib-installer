# cpp-lib-installer

Install C/C++ libraries from source.

This script assumes it is started from the project root, and that a `deps` directory is present.

Example `dependencies.csv`:

```csv
philsquared;Catch;cmake;2.0
fmtlib;fmt;cmake;1.5.3
# \n at the end of the file
```

Tested:

```
# cmake

sh cmake_install.sh philsquared Catch cmake
sh cmake_install.sh nlohmann json cmake
sh cmake_install.sh fmtlib fmt cmake
sh cmake_install.sh Microsoft GSL cmake
sh cmake_install.sh google googletest cmake

# autotools

sh cmake_install.sh quickfix quickfix autotools
sh cmake_install.sh google leveldb autotools # doesn't work, no install rule
```
