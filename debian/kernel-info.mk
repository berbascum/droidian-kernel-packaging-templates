########################################################################
# Kernel settings
########################################################################

# Kernel variant. This is currently used only on the Source package name.
# Use 'android' for Android kernels ("downstream") or 'mainline' for upstream
# kernels.
VARIANT = halium11

# Kernel base version
KERNEL_BASE_VERSION = 4.14-0

# Enable for append extended info to the kernel release
KERNEL_DEVELOPER_NAME = l4v3nx
#KBUILD_DROIDIAN_VERSION = d0-rc0[-debug]

# The kernel cmdline to use
KERNEL_BOOTIMAGE_CMDLINE = androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7 androidboot.usbcontroller=a600000.dwc3 console=tty0 systemd.unified_cgroup_hierarchy=1 androidboot.selinux=permissive enforcing=0 selinux=0 buildvariant=userdebug cgroup_disable=pressure ramoops_memreserve=4M audit=1

# luks.cust.dev=/dev/mmcblk0p4
# Add to avoid the lvm resize at the first boot
  # droidian.lvm.noresize
# In development, early access available
# droidian.lvm.noresize luks.cust.dev=/dev/mmcblk0p4

## Boot params for debug
      ## buildvariant=user|userdebug
   ## ramoops_memreserve: Reserve persist log area
      ## ramoops_memreserve=4M
   ## disable psi: for production
      ## cgroup_disable=pressure

## Boot params for testing
# console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x4a90000

# Slug for the device vendor. This is going to be used in the KERNELRELASE
# and package names.
DEVICE_VENDOR = xiaomi

# Slug for the device model. Like above.
DEVICE_MODEL = vayu

# Slug for the device platform. If unsure, keep this commented.
# DEVICE_PLATFORM = platform

# Marketing-friendly full-name. This will be used inside package descriptions
DEVICE_FULL_NAME = Xiaomi POCO X3 Pro

# Whether to use configuration fragments to augment the kernel configuration.
# If unsure, keep this to 0.
KERNEL_CONFIG_USE_FRAGMENTS = 1

# Enable kernel config device extra fragments (extended)
KERNEL_CONFIG_USE_EXTRA_FRAGMENTS = 1
KERNEL_CONFIG_EXTRA_FRAGMENTS = vayu-halium.config vayu-droidian.config vayu-lxc.config vayu-security.config vayu-network.config vayu-camera.config vayu-kvm.config vayu-container.config
# vayu-cpu.config
# vayu-boot.config
# vayu-lto-disable.config
## Development fragments
KERNEL_CONFIG_USE_DEVEL_FRAGMENTS = 0
# KERNEL_CONFIG_DEVEL_FRAGMENTS = vayu-test.config vayu-develop.config
KERNEL_CONFIG_USE_DEBUG_FRAGMENTS = 1
KERNEL_CONFIG_DEBUG_FRAGMENTS = common_fragments/debug.config vayu-debug-main.config
# vayu-debug-extra.config

# Whether to use diffconfig to generate the device-specific configuration.
# If you enable this, you should set KERNEL_CONFIG_USE_FRAGMENTS to 1.
# If unsure, keep this to 0.
KERNEL_CONFIG_USE_DIFFCONFIG = 0

# The diffconfig to apply. Only used when KERNEL_CONFIG_USE_DIFFCONFIG is
# enabled.
# KERNEL_PRODUCT_DIFFCONFIG = my_diffconfig

# Defconfig to use
KERNEL_DEFCONFIG = vayu_defconfig

# Whether to include DTBs with the image. Use 0 (no) or 1.
# GKI devices should set this to 0
KERNEL_IMAGE_WITH_DTB = 1

# Path to the DTB
# If you leave this undefined, an attempt to find it automatically
# will be made.
KERNEL_IMAGE_DTB = arch/arm64/boot/dts/qcom/sm8150-v2.dtb

# Whether to include a DTB Overlay. Use 0 (no) or 1.
# GKI devices should set this to 0
KERNEL_IMAGE_WITH_DTB_OVERLAY = 1

# Path to the DTB overlay.
# If you leave this undefined, an attempt to find it automatically
# will be made.
KERNEL_IMAGE_DTB_OVERLAY = arch/arm64/boot/dts/qcom/vayu-sm8150-overlay.dtbo

# Whether to include the DTB Overlay into the kernel image
# Use 0 (no, default) or 1.
# dtbo.img will always be shipped in the linux-bootimage- package.
# GKI devices should set this to 0
KERNEL_IMAGE_WITH_DTB_OVERLAY_IN_KERNEL = 0

# Path to a specifc configuration file for mkdtboimg.
# The default is to leave it undefined.
# KERNEL_IMAGE_DTB_OVERLAY_CONFIGURATION = debian/custom_dtbo_config.cfg

# Path to the DTB directory. Only define if KERNEL_IMAGE_DTB_OVERLAY_CONFIGURATION
# is defined too.
# KERNEL_IMAGE_DTB_OVERLAY_DTB_DIRECTORY = arch/arm64/boot/dts/qcom

# Path to the prebuilt DT image. should only be defined on header version 1 and below. 
# mostly used on samsung devices. default is to leave it undefined
# KERNEL_PREBUILT_DT = debian/dt.img

# Various other settings that will be passed straight to mkbootimg
# GKI devices can leave BASE_OFFSET, KERNEL_OFFSET, INITRAMFS_OFFSET, SECOND_OFFSET and TAGS_OFFSET empty
KERNEL_BOOTIMAGE_PAGE_SIZE = 4096
KERNEL_BOOTIMAGE_BASE_OFFSET = 0x00000000
KERNEL_BOOTIMAGE_KERNEL_OFFSET = 0x00008000
KERNEL_BOOTIMAGE_INITRAMFS_OFFSET = 0x01000000
KERNEL_BOOTIMAGE_SECONDIMAGE_OFFSET = 0x00f00000
KERNEL_BOOTIMAGE_TAGS_OFFSET = 0x00000100

# Specify boot image security patch level if needed
KERNEL_BOOTIMAGE_PATCH_LEVEL = 2022-01-01

# Specify boot image OS version if needed
# KERNEL_BOOTIMAGE_OS_VERSION = 11.0.0

# Required for header version 2, ignore otherwise
# GKI devices should leave this offset empty
KERNEL_BOOTIMAGE_DTB_OFFSET = 0x0f00000

# Kernel bootimage version. Defaults to 0 (legacy header).
# As a rule of thumb:
# Devices launched with Android 8 and lower: version 0
# Devices launched with Android 9: version 1
# Devices launched with Android 10: version 2
# Devices launched with Android 11: version 2 or 3 (GKI)
# Devices launched with Android 12: version 3 (GKI) or 4 (GKI)
# Devices launched with Android 13: version 3 (GKI) or 4 (GKI)
KERNEL_BOOTIMAGE_VERSION = 2

# Kernel initramfs compression. Defaults to gzip.
# All non-gki devices need a gzip (gz) initramfs
# For devices launched with a GKI kernel it can be either gzip (gz) or lz4 (lz4)
KERNEL_INITRAMFS_COMPRESSION = gz

########################################################################
# Android verified boot
########################################################################

# Whether to build a flashable vbmeta.img. Please note that currently
# only empty vbmeta images (disabling verified boot) can be generated.
# Use 0 (no) or 1 (default).
DEVICE_VBMETA_REQUIRED = 1

# Samsung devices require a special flag. Enable the following if your
# device is a Samsung device that requires flag 0 to be present
# Use 0 (no, default) or 1.
DEVICE_VBMETA_IS_SAMSUNG = 0

# boot partition size. If specified, an AVB footer will be added at the
# end of the bootimage.
# KERNEL_BOOTIMAGE_PARTITION_SIZE = 134217728

########################################################################
# Automatic flashing on package upgrades
########################################################################

# Whether to enable kernel upgrades on package upgrades. Use 0 (no) or 1.
FLASH_ENABLED = 1

# If your device is treble-ized, but aonly, you should set the following to
# 1 (yes).
FLASH_IS_AONLY = 1

# `flash-bootimage` defaults are enough for most recent devices, but legacy
# devices won't work out of the box.
# If you set the following to 1, this package will set `flash-bootimage`'s
# DEVICE_IS_AB and BOOTIMAGE_SLOT_A accordingly, thus enabling flashing
# on older devices.
#
# Do not enable if you don't know what you're doing
FLASH_IS_LEGACY_DEVICE = 0

# On some exynos devices partition names are capitalized (boot is BOOT and so on)
# This flag makes the kernel to get flashed to the correct partition on updates.
FLASH_IS_EXYNOS = 0

# On some devices flashing userdata.img via fastboot fails and telnet should
# be used instead. Set to 1 for telnet and 0 for fastboot
FLASH_USE_TELNET = 0

# Device manufacturer. This must match the `ro.product.vendor.manufacturer`
# Android property. If you don't want to specify this, leave it undefined,
# FLASH_INFO_CPU will be checked instead.
FLASH_INFO_MANUFACTURER = Xiaomi

# Device model. This must match the `ro.product.vendor.model`
# On Xiaomi vayu there are different vendor images (miui 1lineage with diferent ro.ptoduct.vendor.model,
# since the value configured is `ro.product.vendor.device`. A patch for flash-bootimage script
# is also included in the droidian adaptation package
# Android property. If you don't want to specify this, leave it undefined,
# FLASH_INFO_CPU will be checked instead.
FLASH_INFO_MODEL = M2102J20SG
#FLASH_INFO_MODEL = POCO X3 Pro

# Device CPU. This will be grepped against /proc/cpuinfo to check if
# we're running on the specific device. Note this is a last-resort
# method, specifying FLASH_INFO_MANUFACTURER and FLASH_INFO_MODEL is
# recommended.
# FLASH_INFO_CPU = Qualcomm Technologies, Inc SM8150

# Space-separated list of supported device ids as reported by fastboot
# F#LASH_INFO_DEVICE_IDS = sm8151 2a03db75

########################################################################
# Kernel build settings
########################################################################

# Whether to cross-build. Use 0 (no) or 1.
BUILD_CROSS = 1

# Enable verbose mode on the make command
# Requires modifications in the kernel-snippet.mk
ENABLE_VERBOSE = 0

# (Cross-build only) The build triplet to use. You'll probably want to
# use aarch64-linux-android- if building Android kernels.
# might need to use aarch64-linux-gnu- with newer kernels such as GKI
BUILD_TRIPLET = aarch64-linux-android-

# (Cross-build only) The build triplet to use with clang. You'll probably
# want to use aarch64-linux-gnu- here.
BUILD_CLANG_TRIPLET = aarch64-linux-gnu-

# The compiler to use. Recent Android kernels are built with clang.
BUILD_CC = clang

# Use llvm instead of gcc. Recent Android kernels (past android 12) need llvm.
BUILD_LLVM = 1

# Set to 1 to skip modules packaging if CONFIG_MODULES is disabled in defconfig
BUILD_SKIP_MODULES = 0

# Clang Droidian prebuilts for amd64 hosts
  #  6 4691093     9 r353983c    10 r370808
  # 12 r416183b   14 r450784d

# Clang Debian prebuilts for arm64 (gnu, not android)
# Requires CLANG_VERSION and should be an int
#   * From Droidian 100: 14, 16, 17, 18, 19
#   * From trixie:       15, 17, 18, 19
#   * From bullseye:     9, 11, 13, 16
# Currently available versions 11 and 13

# CLANG_VERSION will be used for Droidian/Debian prebuilts showed above
# Must be in integer format
CLANG_VERSION = 10

# BUILD_PATH:
# Extra paths to prepend to the PATH variable.
# This var is required by the official Droidian toolchains
# Sample path for Droidian clang 10
# BUILD_PATH = /usr/lib/llvm-android-10.0-r370808/bin
# When using clang and the clang-conf-advanced snippet,
# the clang path will be automatically configured
# Anyway, any other paths configured in BUILD_PATH will be appended to PATH after the clang path
BUILD_PATH = /path/to/custom/toolchain/bin

# Extra packages to add to the Build-Depends section. Mainline builds
# can have this section empty, unless cross-building.
# The default is enough to install the Android toolchain, including clang.
# When using clang and the clang-conf-advanced snippet,
# no clang packages are required here.
# Anyway, the snippet will clean the packages list.
# Also will be used by the clang-custom feature.
DEB_TOOLCHAIN = device-tree-compiler, linux-initramfs-halium-generic:arm64, binutils-aarch64-linux-gnu, gcc-4.9-aarch64-linux-android, g++-4.9-aarch64-linux-android, libgcc-4.9-dev-aarch64-linux-android-cross

# CLANG_CUSTOM:
# Set to 1 to use a not Droidian official clang prebuilt
# For using a manually installed prebuilt,
# just enable CLANG_CUSTOM and configure the BUILD_PATH
# REQS:
  # BUILD_LLVM = 1
  # BUILD_PATH = /any/clang/valid/path
CLANG_CUSTOM = 0

# BUILD_PATH_CLANG_CUSTOM:
# This var is required here, but is autoconfigured by the
# clang-conf-advanced snippet
BUILD_PATH_CLANG_CUSTOM = /some/path/bin

# DOWNLOAD_CLANG_CUSTOM
# REQS:
  # CLANG_CUSTOM = 1
# EXPERIMENTAL: Early support for change custom url
# Follow the format in the defaults below
# There are two predefined repos for each arm64 and amd64 archs
DOWNLOAD_CLANG_CUSTOM = 0

# Clang Prebuilts external repos
# Clang amd64 hosts: berbascum-repo prebuilts
# The branches starting with clang- were cleaned keepeng only
  # Url: https://github.com/android-berb/platform.prebuilts.clang.host.linux-x86.git
  # Versions
  # clang-9-r353983c-a11-x86
  # clang-10-r377782d-a11-x86
  # clang-11-r383902b-a11-x86
  # clang-12-r416183b-a12-x86
  # clang-14-r450784e-a14-x86
# Clang amd64 vars
# CLANG_CUSTOM_VERSION_<arch> and CLANG_CUSTOM_ANDROID_<arch> might be required
CLANG_CUSTOM_REVISION_AMD64 = r416183b
CLANG_CUSTOM_VERSION_AMD64 = 12
CLANG_CUSTOM_ANDROID_AMD64 = 12
# Clang custom url amd64
CLANG_CUSTOM_BRANCH_AMD64 = clang-$(CLANG_CUSTOM_VERSION_AMD64)-$(CLANG_CUSTOM_REVISION_AMD64)-a$(CLANG_CUSTOM_ANDROID_AMD64)-x86
# CLANG_CUSTOM_FILE_AMD64 =
CLANG_CUSTOM_URL_AMD64 = https://github.com/android-berb/platform.prebuilts.clang.host.linux-x86.git

# Clang arm64 hosts: tomxi1997-repo prebuilts
  # Url latest
  # https://github.com/tomxi1997/Toolchain-for-aarch64-hosts/releases/download/v15
  # Url old versions
  # https://github.com/tomxi1997/AOSP-Clang_arm64/releases/download/v5.1
  # Versions
  #  9.0.8 a11 r365631c # Old repo only
  # 11.0.0 a11 r383902
  # 11.0.4 a12 r399163
  # 12.0.? a12 r416183b
  # 14.0.? a14 r450784b | r450784d
# Clang amd64 vars
# CLANG_CUSTOM_VERSION_<arch> and CLANG_CUSTOM_ANDROID_<arch> might be required
CLANG_CUSTOM_REVISION_ARM64 = r416183b
CLANG_CUSTOM_VERSION_ARM64 = 12
CLANG_CUSTOM_ANDROID_ARM64 = 12
# Clang custom url arm64
# CLANG_CUSTOM_BRANCH_ARM64 =
CLANG_CUSTOM_FILE_ARM64 = clang-$(CLANG_CUSTOM_REVISION_ARM64).tar.xz
CLANG_CUSTOM_URL_ARM64 = https://github.com/tomxi1997/Toolchain-for-aarch64-hosts/releases/download/v15/$(CLANG_CUSTOM_FILE_ARM64)

# Where we're going to run this kernel on
DEB_BUILD_FOR = arm64

# Target kernel architecture
KERNEL_ARCH = arm64

# Kernel target to build
KERNEL_BUILD_TARGET = Image.gz
