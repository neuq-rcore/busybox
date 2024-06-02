#!/bin/bash

DEFCONFIG="allnoconfig"
O="out"
ARCH="x86_64"

GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
RESET="\033[0m"

# clean environment
echo -e "${YELLOW}-> make mrproper ...${RESET}"
rm -rf $O
rm -f busybox-${ARCH}
make mrproper

# build kernel
echo -e "${YELLOW}-> make ${DEFCONFIG} ...${RESET}"
mkdir -p $O
make O=$O ARCH=$ARCH $DEFCONFIG

echo -e "${YELLOW}-> make ...${RESET}"
make -j$(nproc --all) O=$O \
                      ARCH=$ARCH \
                      CROSS_COMPILE=

cp $O/busybox busybox-${ARCH}
echo -e "${GREEN}=> cat busybox-${ARCH}${RESET}"
