# Copyright (C) 2014 The Android Open-Source Project
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
USE_CAMERA_STUB := true

MSM7627A_PATH := device/hisense/msm7627a-common

-include device/qcom/msm7627a/BoardConfig.mk
-include vendor/hisense/msm7627a-common/BoardConfigVendor.mk

# modify build/core/binary.mk to include this,
TARGET_SPECIFIC_HEADER_PATH := $(MSM7627A_PATH)/include

# CPU and Platform
TARGET_BOARD_PLATFORM := msm7627a
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
BOARD_USES_QCOM_HARDWARE := true
QCOM_TARGET_PRODUCT := msm7627a
BOARD_KERNEL_CMDLINE := console=tty,115200n8 androidboot.hardware=qcom

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50001
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

# egl configuration for adreno200
BOARD_EGL_CFG := $(MSM7627A_PATH)/egl.cfg

# Graphics
USE_OPENGL_RENDERER := true

BOARD_HAS_ATH_WLAN := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_2_0_DEV
HOSTAPD_VERSION := VER_2_0_DEV
WIFI_CFG80211_DRIVER_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
WIFI_CFG80211_DRIVER_MODULE_NAME := "cfg80211"
WIFI_CFG80211_DRIVER_MODULE_ARG  := ""
WIFI_TEST_INTERFACE     := "sta"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"

TARGET_GLOBAL_CFLAGS 	+= -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS 	+= -mfpu=neon -mfloat-abi=softfp
