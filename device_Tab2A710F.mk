LOCAL_PATH := device/lenovo/Tab2A710F

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/Tab2A710F/Tab2A710F-vendor.mk)

$(call inherit-product, $(LOCAL_PATH)/overlay-binaries/overlay-binaries.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.mt8127.rc:root/init.mt8127.rc \
    $(LOCAL_PATH)/ramdisk/init.mt8127.usb.rc:root/init.mt8127.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.mt8127.rc:root/ueventd.mt8127.rc \
    $(LOCAL_PATH)/ramdisk/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/ramdisk/init.aee.rc:root/init.aee.rc \
    $(LOCAL_PATH)/ramdisk/init.ssd.rc:root/init.ssd.rc \
    $(LOCAL_PATH)/ramdisk/init.charging.rc:root/init.charging.rc \
    $(LOCAL_PATH)/ramdisk/fstab:root/fstab \
    $(LOCAL_PATH)/ramdisk/fstab.mt8127:root/fstab.mt8127 \
    $(LOCAL_PATH)/ramdisk/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/ramdisk/auto_shutdown.sh:root/auto_shutdown.sh \
    $(LOCAL_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/ramdisk/meta_init.rc:root/meta_init.rc \
    $(LOCAL_PATH)/ramdisk/meta_init.project.rc:root/meta_init.project.rc

# libxlog
PRODUCT_PACKAGES += \
    libxlog

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# libbt-vendor
PRODUCT_PACKAGES += \
    libbt-vendor

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth.default

# hostapd config files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# hostapd
PRODUCT_PACKAGES += \
    hostapd

# mtk_omx
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg

# thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal.conf:system/etc/.tp/thermal.conf \
    $(LOCAL_PATH)/configs/thermal/thermal.off.conf:system/etc/.tp/thermal.off.conf

# Wifi config files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Bluetooth config files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
    $(LOCAL_PATH)/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml

# media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Audio policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

