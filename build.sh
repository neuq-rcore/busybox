#!/bin/bash

DEFCONFIG="defconfig"
O="out"
ARCH="riscv"

GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
RESET="\033[0m"

# clean environment
echo -e "${YELLOW}-> make mrproper ...${RESET}"
rm -rf $O
make mrproper

# build kernel
echo -e "${YELLOW}-> make ${DEFCONFIG} ...${RESET}"
mkdir -p $O
make O=$O ARCH=$ARCH $DEFCONFIG

echo -e "${YELLOW}-> make ...${RESET}"
make -j$(nproc --all) O=$O \
                      ARCH=$ARCH \
                      CROSS_COMPILE=riscv64-linux-gnu-
