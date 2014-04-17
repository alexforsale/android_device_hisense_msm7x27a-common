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

MSM7627A_PATH := device/hisense/msm7627a-common

MSM7627A_SCRIPTS := $(MSM7627A_PATH)/scripts
MSM7627A_PERMISSIONS := $(MSM7627A_PATH)/prebuilt/system/etc/permissions
MSM7627A_PERSIST := $(MSM7627A_PATH)/prebuilt/persist
MSM7627A_DATA := $(MSM7627A_PATH)/prebuilt/data
MSM7627A_KEYCHARS := $(MSM7627A_PATH)/prebuilt/system/usr/keychars
MSM7627A_KEYLAYOUT := $(MSM7627A_PATH)/prebuilt/system/usr/keylayout
MSM7627A_ETC := $(MSM7627A_PATH)/prebuilt/system/etc
MSM7627A_BIN := $(MSM7627A_PATH)/prebuilt/system/bin
MSM7627A_LIB := $(MSM7627A_PATH)/prebuilt/system/lib
MSM7627A_ROOT := $(MSM7627A_PATH)/prebuilt/rootdir

DEVICE_PACKAGE_OVERLAYS := $(MSM7627A_PATH)/overlay

$(call inherit-product, device/qcom/common/common.mk)

ifneq ($(TARGET_PROVIDES_LIBSENSORS),true)
PRODUCT_COPY_FILES += \
    $(MSM7627A_LIB)/hw/sensors.default.so:system/lib/hw/sensors.default.so
else
ifeq ($(TARGET_PROVIDES_LIBSENSORS),true)
PRODUCT_PACKAGES += \
    sensors.$(TARGET_BOOTLOADER_BOARD_NAME)
endif
endif

ifneq ($(TARGET_PROVIDES_LIBLIGHTS),true)
PRODUCT_COPY_FILES += \
    $(MSM7627A_LIB)/hw/lights.msm7627a.so:system/lib/hw/lights.msm7627a.so
else
ifeq ($(TARGET_PROVIDES_LIBLIGHTS),true)
PRODUCT_PACKAGES += \
    lights.$(TARGET_BOOTLOADER_BOARD_NAME)
endif
endif

ifeq ($(STOCK_CAMERA_HW_LIB),true)
PRODUCT_COPY_FILES += \
    $(MSM7627A_LIB)/hw/camera.msm7627a.so:system/lib/hw/camera.msm7627a.so
endif


# Non-Ramdisk Init Scripts
PRODUCT_COPY_FILES += \
    $(MSM7627A_SCRIPTS)/efsbackup.sh:system/bin/efsbackup.sh \
    $(MSM7627A_SCRIPTS)/goldfishkiller.sh:system/bin/goldfishkiller.sh \
    $(MSM7627A_SCRIPTS)/sysinit:system/bin/sysinit

# prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(MSM7627A_PATH)/prebuilt/system,system)

# Ramdisk files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(MSM7627A_PATH)/prebuilt/rootdir,root)

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers \
        librs_jni \

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
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#Bluetooth configuration files
PRODUCT_COPY_FILES += \
   system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

PRODUCT_PROPERTY_OVERRIDES += \
    persist.adb.notify=0 \
    ro.setupwizard.enable_bypass=1 \
    wifi.supplicant_scan_interval=30 \
    ro.opengles.version=131072 \
    net.dns1=8.8.8.8 \
    net.dns2=8.8.4.4 \
    ro.opengles.version=131072 \
    ro.use_data_netmgrd=true \
    ro.com.android.dataroaming=true \
    ro.product.hasphonestorage=true \
    ro.telephony.default_network=4,1 \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    httplive.enable.discontinuity=true \
    ro.max.fling_velocity=4000 \
    debug.camera.landscape=true \
    debug.camcorder.disablemeta=0 \
    ro.qualcomm.cabl=false \
    ro.config.ehrpd=true \
    debug.bt.discoverable_time=0 \
    ro.bluetooth.remote.autoconnect=true \
    ro.qualcomm.bluetooth.sap=true \
    ro.qualcomm.bluetooth.ftp=true \
    ro.bluetooth.request.master=true \
    audio.legacy.postproc=true \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=36m \
    dalvik.vm.heapsize=128m
