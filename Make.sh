#!/bin/bash

YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

cd && cd Unicornblood_N

rm -rf AnyKernel2-ETHER AnyKernel2-BULLHEAD

repo sync

echo -e $YELLOW"Lets build Ether..."$ENDCOLOR

export PATH=$HOME/Unicornblood_N/prebuilt/aarch64-linux-android-4.9/bin:$PATH

export ARCH=arm64 && export CROSS_COMPILE=aarch64-linux-android-

cd android_kernel_nextbit_msm8992 && make clean && make mrproper

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE ether_defconfig

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood_N

mv android_kernel_nextbit_msm8992/arch/arm64/boot/Image.gz-dtb AnyKernel2-ETHER
cd AnyKernel2-ETHER
zip -r9 Unicornblood_N-ETHER-$(date +%m%d%Y).zip * -x README Unicornblood_N-ETHER-$(date +%m%d%Y).zip

cd && cd Unicornblood_N

echo -e $YELLOW"Lets build Bullhead Next..."$ENDCOLOR

export PATH=$HOME/Unicornblood_N/prebuilt/aarch64-linux-android-4.9/bin:$PATH

export ARCH=arm64 && export CROSS_COMPILE=aarch64-linux-android-

cd android_kernel_lge_bullhead && make clean && make mrproper

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE bullhead_defconfig

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood_N

mv android_kernel_lge_bullhead/arch/arm64/boot/Image.gz-dtb AnyKernel2-BULLHEAD
cd AnyKernel2-BULLHEAD
zip -r9 Unicornblood_N-BULLHEAD-$(date +%m%d%Y).zip * -x README Unicornblood_N-BULLHEAD-$(date +%m%d%Y).zip

cd && cd Unicornblood_N

