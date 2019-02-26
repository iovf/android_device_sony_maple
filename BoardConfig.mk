#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

### INHERIT FROM YOSHIRO
TARGET_RECOVERY_DEVICE_DIRS += device/sony/maple/proprietary
TARGET_COMPILE_WITH_MSM_KERNEL := true
DEVICE_PATH := device/sony/maple

PRODUCT_PLATFORM := yoshino

### BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := G8141

### PARTITIONS
# See also /proc/partitions on the device
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 398458880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 7707033600
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 54587727872
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_ROOT_EXTRA_FOLDERS := \
    bt_firmware \
    dsp \
    firmware \
    idd \
    misc \
    persist \
    qns \
    rca

# vendor
TARGET_COPY_OUT_VENDOR := system/vendor
TARGET_USES_CASH_EXTENSION := true

### LIGHTS
TARGET_PROVIDES_LIBLIGHT := true

TARGET_BOARD_PLATFORM := msm8998
TARGET_BOARD_PLATFORM_GPU := qcom-adreno540

### PROCESSOR
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73
TARGET_CPU_SMP := true
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73
TARGET_USES_64_BIT_BINDER := true
ENABLE_CPUSETS := true

### KERNEL
TARGET_KERNEL_CONFIG := lineage-msm8998-yoshino-maple_defconfig
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 coherent_pool=8M androidboot.bootdevice=1da4000.ufshc display_status=on lpm_levels.sleep_disabled=1 user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 zram.backend=z3fold androidboot.selinux=permissive androidboot.hardware=maple buildvariant=userdebug
#TARGET_PREBUILT_KERNEL := device/sony/maple/prebuilt/Image.gz-dtb
TARGET_KERNEL_VERSION := 4.4
TARGET_KERNEL_SOURCE  := kernel/sony/msm8998
# See README_Xperia in Kernel Source
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_RAMDISK_OFFSET     := 0x01000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Build ext4 tools - system/vold
TARGET_USERIMAGES_USE_EXT4 := true

# Native sdfat (exfat) support - system/vold
TARGET_EXFAT_DRIVER := sdfat

### HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

### TWRP
# Do not go full treble for recovery
PRODUCT_FULL_TREBLE_OVERRIDE := false
RECOVERY_VARIANT := twrp
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/twrp.fstab
### INIT
# Use rootdir/init.recovery.usb.rc
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_RECOVERY_DEVICE_MODULES := init.recovery.usb.rc
### QCOM
TARGET_RECOVERY_QCOM_RTC_FIX := true
#TW_TARGET_USES_QCOM_BSP := true
TW_NEW_ION_HEAP := true
### SCREEN BRIGHTNESS
TW_BRIGHTNESS_PATH := /sys/class/leds/wled/brightness
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1600
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone4/temp
# Add logcat support
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
# Use toolbox instead of busybox
TW_USE_TOOLBOX := true
# Does not allow to partition the sdcard
BOARD_HAS_NO_REAL_SDCARD := true
# Media on data partition
RECOVERY_SDCARD_ON_DATA := true

### ENCRYPTED FILESYSTEMS
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
# vendor/qcom/opensource/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
# NEED_KERNEL_MODULE_ROOT := true
# Add strace
#TARGET_RECOVERY_DEVICE_MODULES      += strace
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(OUT)/system/xbin/strace

# /system/manifest.xml
TARGET_RECOVERY_DEVICE_MODULES      += system_manifest.xml

### F2FS SUPPORT
CM_PLATFORM_SDK_VERSION := 3
TARGET_USERIMAGES_USE_F2FS := true
### TWRP FEATURES
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_THEME := portrait_hdpi
# Use a future date for the security patchlevel.  As TWRP doesn't do key
# upgrades it should just be fine using it for decryption.
PLATFORM_SECURITY_PATCH := 2025-12-31
### BOARD
BOARD_USES_QCOM_HARDWARE := true
BOARD_VENDOR := sony
### CHARGER
WITH_LINEAGE_CHARGER := false
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true

BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

PRODUCT_COPY_FILES += \
    system/timezone/output_data/iana/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
    $(DEVICE_PATH)/recovery/vendor/manifest.xml:recovery/root/vendor/manifest.xml
