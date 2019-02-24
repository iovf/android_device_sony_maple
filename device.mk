### DALVIK
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)


# Device uses high-density artwork where available
PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=480 \
    ro.usb.pid_suffix=1F1

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PACKAGES += \
    init.recovery.maple \
    init.maple \
    fstab.maple \
    ueventd.maple
