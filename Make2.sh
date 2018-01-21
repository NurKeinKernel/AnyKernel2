#!/bin/bash

YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

cd && cd Unicornblood_N

rm -rf AnyKernel2-ETHER

repo sync

echo -e $YELLOW"Lets build Ether..."$ENDCOLOR

export PATH=$HOME/Unicornblood_N/prebuilt/aarch64-linux-android-4.9/bin:$PATH

export ARCH=arm64 && export CROSS_COMPILE=aarch64-linux-android-

cd dharma_kernel_nextbit_msm8992 && make clean && make mrproper

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE dharma_defconfig

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood_N

mv dharma_kernel_nextbit_msm8992/arch/arm64/boot/Image.gz-dtb AnyKernel2-ETHER
cd AnyKernel2-ETHER
zip -r9 DHARMA_N-ETHER-$(date +%m%d%Y).zip * -x README DHARMA_N-ETHER-$(date +%m%d%Y).zip

cd && cd Unicornblood_N
