OVERLAY_BIN := device/lenovo/Tab2A7-common/overlay-binaries

# Install init.d scripts
PRODUCT_COPY_FILES += \
        $(OVERLAY_BIN)/00permissions:system/etc/init.d/00permissions

