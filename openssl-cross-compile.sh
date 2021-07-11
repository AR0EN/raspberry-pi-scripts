#!/bin/bash

# Target: Raspberry PI 2 Model B V1.1

# Dependencies:
## [OpenSSL v1.1.1k](https://www.openssl.org/source/openssl-1.1.1k.tar.gz)

# References
## https://wiki.openssl.org/index.php/Compilation_and_Installation
## https://stackoverflow.com/questions/60821697/how-to-build-openssl-for-arm-linux

# Location of toolchain
export TOOLCHAIN_DIR=/var/host-shared/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf

# Generate Makefiles, and headers
./Configure linux-armv4 -march=armv7-a --cross-compile-prefix=$TOOLCHAIN_DIR/bin/arm-none-linux-gnueabihf- no-ssl2 no-ssl3 --prefix=/opt/openssl-1.1.1k --openssldir=/opt/openssl-1.1.1k

# Compile
make
