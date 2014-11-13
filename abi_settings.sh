#!/bin/bash

. settings.sh

BASEDIR=$2

case $1 in
  armeabi)
    NDK_ABI='arm'
    NDK_TOOLCHAIN_ABI_DIR='arm-linux-androideabi'    
	NDK_TOOLCHAIN_ABI_COMPILER='arm-linux-androideabi'
  ;;
  armeabi-v7a)
    NDK_ABI='arm'
    NDK_TOOLCHAIN_ABI_DIR='arm-linux-androideabi'
	NDK_TOOLCHAIN_ABI_COMPILER='arm-linux-androideabi'
    ARCH_CPU='armv7-a'
    CFLAGS="$CFLAGS -march=$ARCH_CPU"
  ;;
  mipsel)
  	NDK_ABI='mipsel'
  	NDK_TOOLCHAIN_ABI_DIR='mipsel-linux-android'
	NDK_TOOLCHAIN_ABI_COMPILER='mipsel-linux-android'
  ;;
  x86)
    NDK_ABI='x86'
	NDK_TOOLCHAIN_ABI_DIR='x86'
	NDK_TOOLCHAIN_ABI_COMPILER='i686-linux-android'
  ;;
  x86_64)
  	NDK_ABI='x86_64'
	NDK_TOOLCHAIN_ABI_DIR='x86_64'
	NDK_TOOLCHAIN_ABI_COMPILER='x86_64-linux-android'
  ;;
esac



TOOLCHAIN_PREFIX=${BASEDIR}/toolchain-android
if [ ! -d "$TOOLCHAIN_PREFIX" ]; then
  ${ANDROID_NDK_ROOT_PATH}/build/tools/make-standalone-toolchain.sh --toolchain=${NDK_TOOLCHAIN_ABI_DIR}-${NDK_TOOLCHAIN_ABI_VERSION} --platform=android-${ANDROID_API_VERSION} --install-dir=${TOOLCHAIN_PREFIX}
fi


CROSS_PREFIX=${TOOLCHAIN_PREFIX}/bin/${NDK_TOOLCHAIN_ABI_COMPILER}-
NDK_SYSROOT=${TOOLCHAIN_PREFIX}/sysroot


export CFLAGS="${CFLAGS} -Wformat -Wformat-security -Werror=format-security --param ssp-buffer-size=4  -fstack-protector -D_FORTIFY_SOURCE=2 -I${TOOLCHAIN_PREFIX}/include"
export LDFLAGS="-Wl,-z,relro -Wl,-z,now -pie -L${TOOLCHAIN_PREFIX}/lib"
export CPPFLAGS='-Wformat -Wformat-security -Werror=format-security --param ssp-buffer-size=4 -fstack-protector -D_FORTIFY_SOURCE=2'

export PKG_CONFIG_LIBDIR="${TOOLCHAIN_PREFIX}/lib/pkgconfig"

export CC="${CROSS_PREFIX}gcc --sysroot=${NDK_SYSROOT}"
export LD="${CROSS_PREFIX}ld"
export RANLIB="${CROSS_PREFIX}ranlib"
export STRIP="${CROSS_PREFIX}strip"
export READELF="${CROSS_PREFIX}readelf"
export OBJDUMP="${CROSS_PREFIX}objdump"
export ADDR2LINE="${CROSS_PREFIX}addr2line"
export AR="${CROSS_PREFIX}ar"
export AS="${CROSS_PREFIX}as"
export CXX="${CROSS_PREFIX}g++"
export OBJCOPY="${CROSS_PREFIX}objcopy"
export ELFEDIT="${CROSS_PREFIX}elfedit"
export CPP="${CROSS_PREFIX}cpp"
export DWP="${CROSS_PREFIX}dwp"
export GCONV="${CROSS_PREFIX}gconv"
export GDP="${CROSS_PREFIX}gdb"
export GPROF="${CROSS_PREFIX}gprof"
export NM="${CROSS_PREFIX}nm"
export SIZE="${CROSS_PREFIX}size"
export STRINGS="${CROSS_PREFIX}strings"
