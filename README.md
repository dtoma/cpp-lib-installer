# cpp-lib-installer

Install C/C++ libraries from source.

This script assumes it is started from the project root, and that a `deps` directory is present.

Usage: `./install_libs.sh dependencies.csv`

Example `dependencies.csv`:

```csv
philsquared;Catch;cmake;2.0
fmtlib;fmt;cmake;1.5.3
# \n at the end of the file
```

Tested:

```
# cmake

philsquared Catch cmake
nlohmann json cmake
fmtlib fmt cmake
Microsoft GSL cmake
google googletest cmake

# autotools

quickfix quickfix autotools
google leveldb autotools # doesn't work, no install rule
```
