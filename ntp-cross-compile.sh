#!/bin/bash

# Target: Raspberry PI 2 Model B V1.1

# Dependencies
## [NTP v4.2.8p15](http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p15.tar.gz)
## [OpenSSL v1.1.1k](https://www.openssl.org/source/openssl-1.1.1k.tar.gz)

# References
## https://stackoverflow.com/questions/40470198/cant-get-ntp-to-cross-compile-to-arm

# Location of toolchain
export TOOLCHAIN_DIR=/var/host-shared/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf

# Location of OpenSSL
# Assumption: OpenSSL has been compiled from source
export OPENSSL_DIR=/var/host-shared/openssl-1.1.1k

# Generate Makefiles, and headers
./configure \
    --enable-LOCAL-CLOCK \
    --with-openssl-libdir=$OPENSSL_DIR \
    --with-openssl-incdir=$OPENSSL_DIR/include \
    --with-yielding-select=yes \
    CFLAGS=-static \
    --host=arm-none-linux-gnueabihf \
    CC=$TOOLCHAIN_DIR/bin/arm-none-linux-gnueabihf-gcc  \
    LD=$TOOLCHAIN_DIR/bin/arm-none-linux-gnueabihf-ld  \
    AS=$TOOLCHAIN_DIR/bin/arm-none-linux-gnueabihf-as

# Compile
make
