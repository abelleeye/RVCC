#!/usr/bin/env bash

set -e

# sudo apt install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev libglib2.0-dev clang ninja-build 


cd ~
rm -rf riscv-temp riscv

mkdir riscv-temp
cd riscv-temp
wget https://mirror.iscas.ac.cn/plct/riscv-gnu-toolchain.20220725.tar.bz2

echo '73448b2c99cda591fdb5b51fd28bf611  riscv-gnu-toolchain.20220725.tar.bz2' | md5sum -c
if [ $? != 0 ]; then 
    echo "Download failed! Please run again." 
    exit 1
fi

tar xvf riscv-gnu-toolchain.20220725.tar.bz2

cd riscv-gnu-toolchain
mkdir build
cd build

unset LD_LIBRARY_PATH
../configure --prefix=~/riscv

make build-sim linux -j $(nproc)

rm -rf ~/riscv-temp
echo "Compilation Complete!"
