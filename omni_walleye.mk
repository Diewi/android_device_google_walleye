# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/walleye/overlay-omni
PRODUCT_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/google/walleye/device-walleye.mk)
$(call inherit-product-if-exists, vendor/google/walleye/walleye-vendor.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_walleye
PRODUCT_DEVICE := walleye
PRODUCT_BRAND := OmniRom
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := Pixel 2

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=walleye \
    BUILD_FINGERPRINT=google/walleye/walleye:8.1.0/OPM2.171026.006.C1/4769658:user/release-keys \
    PRIVATE_BUILD_DESC="walleye-user 8.1.0 OPM2.171026.006.C1 4769658 release-keys"
