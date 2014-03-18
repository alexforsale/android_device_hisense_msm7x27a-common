#
# Copyright (C) 2014 The Android Open Source Project
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
#

DEVICE_PACKAGE_OVERLAYS := device/hisense/msm7x27a-common/overlay
# counterpart to this file, if it exists
-include vendor/hisense/msm7x27a-common/msm7x27a-common-vendor-blobs.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/common/gps/gps_as_supl.mk)

# Inherit hdpi  
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi
PRODUCT_MANUFACTURER := hisense

# Non-Ramdisk Init Scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/scripts/efsbackup.sh:system/bin/efsbackup.sh \
    $(LOCAL_PATH)/scripts/goldfishkiller.sh:system/bin/goldfishkiller.sh

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/hisense/msm7x27a-common/rootdir,root)

# prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/hisense/msm7x27a-common/prebuilts/system,system)

# permission
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

# Video
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libtilerenderer \
    libQcomUI

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default \
    libaudioutils

# GPS
PRODUCT_PACKAGES += \
    gps.default

# misc
PRODUCT_PACKAGES += \
    lights.msm7x27a \
    sensors.default \
    dexpreopt \
    com.android.future.usb.accessory \
    static_busybox \
    make_ext4fs \
    setup_fs

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/persist.prop:$(PRODUCT_OUT)/persist/persist.prop \
   $(LOCAL_PATH)/hostapd.conf:$(PRODUCT_OUT)/data/misc/wifi/hostapd.conf \
   $(LOCAL_PATH)/hostapd.accept:$(PRODUCT_OUT)/data/hostapd/hostapd.accept \
   $(LOCAL_PATH)/hostapd.deny:$(PRODUCT_OUT)/data/hostapd/hostapd.deny \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so \
    persist.adb.notify=0 \
    ro.setupwizard.enable_bypass=1 \
    wifi.supplicant_scan_interval=30 \
    ro.opengles.version=131072

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
