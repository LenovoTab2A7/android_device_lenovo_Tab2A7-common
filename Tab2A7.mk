COMMON_DEVICE_PATH := device/lenovo/Tab2A7-common
COMMON_VENDOR_PATH := vendor/lenovo/Tab2A7-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/Tab2A7-common/Tab2A7-common-vendor.mk)
$(call inherit-product-if-exists, device/lenovo/Tab2A7-common/overlay-binaries/overlay-binaries.mk)

DEVICE_PACKAGE_OVERLAYS += $(COMMON_DEVICE_PATH)/overlay

LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Common properties
$(call inherit-product, $(COMMON_DEVICE_PATH)/common_prop.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(COMMON_DEVICE_PATH)/ramdisk/init.mt8127.rc:root/init.mt8127.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/init.mt8127.usb.rc:root/init.mt8127.usb.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/init.mt8127.power.rc:root/init.mt8127.power.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/ueventd.mt8127.rc:root/ueventd.mt8127.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/init.project.rc:root/init.project.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/init.aee.rc:root/init.aee.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/init.ssd.rc:root/init.ssd.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/init.charging.rc:root/init.charging.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/fstab:root/fstab \
    $(COMMON_DEVICE_PATH)/ramdisk/fstab.mt8127:root/fstab.mt8127 \
    $(COMMON_DEVICE_PATH)/ramdisk/enableswap.sh:root/enableswap.sh \
    $(COMMON_DEVICE_PATH)/ramdisk/auto_shutdown.sh:root/auto_shutdown.sh \
    $(COMMON_DEVICE_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/meta_init.rc:root/meta_init.rc \
    $(COMMON_DEVICE_PATH)/ramdisk/meta_init.project.rc:root/meta_init.project.rc

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
    $(COMMON_DEVICE_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(COMMON_DEVICE_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(COMMON_DEVICE_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# hostapd
PRODUCT_PACKAGES += \
    hostapd

# mtk_omx
PRODUCT_COPY_FILES += \
    $(COMMON_DEVICE_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg

# thermal config
PRODUCT_COPY_FILES += \
    $(COMMON_DEVICE_PATH)/configs/thermal/thermal.conf:system/etc/.tp/thermal.conf \
    $(COMMON_DEVICE_PATH)/configs/thermal/thermal.off.conf:system/etc/.tp/thermal.off.conf

# Wifi config files
PRODUCT_COPY_FILES += \
    $(COMMON_DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_DEVICE_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(COMMON_DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Bluetooth config files
PRODUCT_COPY_FILES += \
    $(COMMON_DEVICE_PATH)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
    $(COMMON_DEVICE_PATH)/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml

# media
PRODUCT_COPY_FILES += \
    $(COMMON_DEVICE_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_DEVICE_PATH)/configs/media/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(COMMON_DEVICE_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Audio policy
PRODUCT_COPY_FILES += \
    $(COMMON_DEVICE_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_DEVICE_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

# Root
PRODUCT_PACKAGES += \
    su

# google media codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# libion
PRODUCT_PACKAGES += \
    libion

# libgralloc.default
PRODUCT_PACKAGES += \
    libgralloc.default

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.default \
    audio_policy.stub \
    audio.r_submix.default \
    audio.usb.default \
    audio.primary.default \
    libaudio-resampler

# Power
PRODUCT_PACKAGES += \
    power.default

# keystore
PRODUCT_PACKAGES += \
    keystore.default

# vibrator.default
PRODUCT_PACKAGES += \
    vibrator.default

