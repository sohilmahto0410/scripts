#!/bin/bash

repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh


echo "======= Remove Project ========="
# # 
rm -rf .repo/local_manifests
rm -rf kernel/xiaomi
rm -rf device/xiaomi
rm -rf device/mediatek/sepolicy_vndr
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi
rm -rf vendor/mediatek



echo "======= Remove Done ======"

git clone --depth=1 https://github.com/sohilmahto0410/device_xiaomi_camellia.git -b infinityx  device/xiaomi/camellia
git clone --depth=1 https://github.com/aLpHa-Git-69/vendor_xiaomi_camellia.git vendor/xiaomi/camellia
git clone --depth=1 https://github.com/dm700-devs/device_xiaomi_camellia-kernel.git device/xiaomi/camellia-kernel
git clone --depth=1 https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims
git clone --depth=1 https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git device/mediatek/sepolicy_vndr
git clone --depth=1 https://github.com/LineageOS/android_hardware_mediatek.git hardware/mediatek
git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi.git hardware/xiaomi


echo "=================="
echo "Cloning Done"
echo "=================="



echo "=================="
echo " Exports Done "
echo "=================="


# Set up build environment
. b*/env*
echo "====== Envsetup Done ======="


# Lunch
lunch infinity_camellia-userdebug
echo "============="


echo "=================="
echo "Building Rom"
echo "=================="
# Build rom
make installclean

m bacon 
