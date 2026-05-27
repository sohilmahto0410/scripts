#!/bin/bash


# Local TimeZone
# sudo rm -rf /etc/localtime
# sudo ln -s /usr/share/zoneinfo/Asia/Dhaka /etc/localtime

# Rom source repo
repo init -u https://github.com/DerpFest-AOSP/android_manifest.git -b 16.2 --git-lfs 


echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
# git clone https://github.com/sohilmahto0410/local_manifests_camellia.git .repo/local_manifests
# echo "============================"
# echo "Local manifest clone success"
# echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# # Remove Project
rm -rf .repo/local_manifests
rm -rf kernel/xiaomi
rm -rf device/xiaomi
rm -rf device/mediatek/sepolicy_vndr
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi
rm -rf vendor/mediatek



echo "======= Remove Done ======"

git clone https://github.com/sohilmahto0410/device_xiaomi_camellia.git device/xiaomi/camellia
git clone https://github.com/aLpHa-Git-69/vendor_xiaomi_camellia.git vendor/xiaomi/camellia
git clone https://github.com/dm700-devs/device_xiaomi_camellia-kernel.git device/xiaomi/camellia-kernel
git clone https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git device/mediatek/sepolicy_vndr
git clone https://github.com/LineageOS/android_hardware_mediatek.git hardware/mediatek
git clone https://github.com/LineageOS/android_hardware_xiaomi.git hardware/xiaomi


echo "=================="
echo "Cloning Done"
echo "=================="

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="


# Lunch
lunch lineage_camellia-bp4a-user
echo "============="

# # Make cleaninstall
make installclean
# echo "============="

echo "=================="
echo "Building Rom"
echo "=================="
# Build rom
mka derp
