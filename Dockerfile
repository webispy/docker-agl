FROM ubuntu:latest

ENV AGL_BASE=/opt/agl-sdk/11.0.5-aarch64 \
    CROSS_TRIPLE=aarch64-agl-linux \
    ARCH=arm64

ENV CROSS_SYSROOT=${AGL_BASE}/sysroots/aarch64-agl-linux \
    PATH=${AGL_BASE}/sysroots/x86_64-aglsdk-linux/usr/bin/aarch64-agl-linux:$PATH

ENV AS=${CROSS_TRIPLE}-as \
    AR=${CROSS_TRIPLE}-ar \
    CC=${CROSS_TRIPLE}-gcc \
    CPP=${CROSS_TRIPLE}-cpp \
    CXX=${CROSS_TRIPLE}-g++ \
    LD=${CROSS_TRIPLE}-ld \
    STRIP=${CROSS_TRIPLE}-strip \
    RANLIB=${CROSS_TRIPLE}-ranlib \
    CROSS_COMPILE=${CROSS_TRIPLE}- \
    PKG_CONFIG_LIBDIR=${CROSS_SYSROOT}/usr/lib/pkgconfig \
    PKG_CONFIG_PATH=${CROSS_SYSROOT}/usr/lib/pkgconfig \
    PKG_CONFIG_SYSROOT_DIR=${CROSS_SYSROOT} \
    CMAKE_TOOLCHAIN_FILE=${CROSS_ROOT}/Toolchain.cmake

COPY nugu/ ${CROSS_SYSROOT}/
COPY Toolchain.cmake /opt/toolchain/

RUN apt-get update \
	&& apt-get install -y make wget curl jq patch python3 xz-utils file \
	&& wget --no-verbose https://download.automotivelinux.org/AGL/release/koi/latest/raspberrypi4/deploy/sdk/poky-agl-glibc-x86_64-agl-demo-platform-crosssdk-aarch64-raspberrypi4-64-toolchain-11.0.5.sh \
	&& chmod +x *.sh \
	&& ./poky*.sh \
	&& rm *.sh \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo "source ${AGL_BASE}/environment-setup-aarch64-agl-linux" >> ~/.bashrc
