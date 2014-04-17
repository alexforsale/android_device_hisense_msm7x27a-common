#
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

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

# if some modules are built directly from this directory (not subdirectories),
# their rules should be written here.
MSM7627A_PATH := device/hisense/msm7627a-common

ifeq ($(PRODUCT_MANUFACTURER),hisense)
ifeq ($(TARGET_BOARD_PLATFORM),msm7627a)
include $(call all-makefiles-under,$(MSM7627A_PATH))
endif # TARGET_BOARD_PLATFORM
endif# PRODUCT_MANUFACTURER
