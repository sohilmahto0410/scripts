#!/bin/bash

rm -rf .repo/local_manifests/

# Local TimeZone
sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Dhaka /etc/localtime

# Rom source repo
repo init -u https://github.com/DerpFest-AOSP/android_manifest.git -b 16.2 --git-lfs -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone https://github.com/sohilmahto0410/local_manifests_camellia.git .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Remove Project
rm -rf rm -rf hardware/mediatek && rm -rf device/mediatek/sepolicy_vndr && rm -rf hardware/xiaomi 
echo "======= Remove Done ======"



# Export
export BUILD_USERNAME= sohilmahto
export BUILD_HOSTNAME=crave
export TARGET_HAS_UDFPS=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_camellia-bp4a-user
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka derp
