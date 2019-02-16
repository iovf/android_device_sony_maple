### PLATFORM
$(call inherit-product, device/sony/yoshino/platform.mk)
### PROPRIETARY VENDOR FILES

ifeq ($(WITH_FDROID),true)
$(call inherit-product, vendor/fdroid/fdroid-vendor.mk)
endif
ifeq ($(WITH_MICROG),true)
$(call inherit-product, vendor/microg/microg-vendor.mk)
endif

### DALVIK
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

DEVICE_PATH := device/sony/maple

# Device uses high-density artwork where available
PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=480 \
    ro.usb.pid_suffix=1F1
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/device/init.mk
else # WITH_TWRP
include $(DEVICE_PATH)/device/*.mk
include $(DEVICE_PATH)/vendor_prop.mk
endif # WITH_TWRP
