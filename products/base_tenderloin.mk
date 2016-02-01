#
# Copyright 2015 The BaseROM Open-Source Project
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
# Include The BaseROM common configuration
include vendor/base/main.mk

# Inherit AOSP device configuration for tenderloin
$(call inherit-product, device/hp/tenderloin/aosp_tenderloin.mk)

# Override AOSP build properties
PRODUCT_NAME := base_tenderloin
PRODUCT_BRAND := google
PRODUCT_DEVICE := tenderloin
PRODUCT_MODEL := HP Touchpad
PRODUCT_MANUFACTURER := HP

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=tenderloin \
    BUILD_FINGERPRINT=google/tenderloin/tenderloin:6.0.1/MMB29P/2473553:user/release-keys \
    PRIVATE_BUILD_DESC="tenderloin-user 6.0.1 MMB29P 2473553 release-keys"
