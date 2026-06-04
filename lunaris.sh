#!/bin/bash


# Rom source repo
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/Lunaris-AOSP/android -b 16.2 -g default,-mips,-darwin,-notdefault


echo "=================="
echo "Repo init success"
echo "=================="

echo "===== Sync the repositories ========"

/opt/crave/resync.sh

echo "======== Syncing Done =========="



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

git clone --depth=1 https://github.com/sohilmahto0410/device_xiaomi_camellia.git -b lunaris device/xiaomi/camellia
git clone --depth=1 https://github.com/aLpHa-Git-69/vendor_xiaomi_camellia.git vendor/xiaomi/camellia
git clone --depth=1 https://github.com/dm700-devs/device_xiaomi_camellia-kernel.git device/xiaomi/camellia-kernel
git clone --depth=1 https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims
git clone --depth=1 https://github.com/xiaomi-mt6789-devs/android_device_mediatek_sepolicy_vndr.git device/mediatek/sepolicy_vndr
git clone --depth=1 https://github.com/LineageOS/android_hardware_mediatek.git hardware/mediatek
git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi.git hardware/xiaomi


sed -i 's/name: "init.mt6833.usb.rc"/name: "init.mt6833.usb.rc_ignore"/' hardware/mediatek/aidl/gadget/Android.bp



echo "=================="
echo "Cloning Done"
echo "=================="

#Exports
export WITH_GMS=false
export TARGET_SUPPORTS_GOOGLE_TELEPHONY=false
export SURFACE_FLINGER_BOOST=true


echo "=================="
echo " Exports Done "
echo "=================="


# Set up build environment
. b*/env*
echo "====== Envsetup Done ======="


# Lunch
lunch lineage_camellia-bp4a-userdebug
echo "============="

# # Make cleaninstall
make installclean
# echo "============="

echo "=================="
echo "Building Rom"
echo "=================="
# Build rom
m bacon
