FROM ubuntu:latest

ENV AGL_BASE=/opt/agl-sdk/11.0.4-corei7-64 \
    CROSS_TRIPLE=x86_64-agl-linux \
    ARCH=arm64

ENV CROSS_SYSROOT=${AGL_BASE}/sysroots/corei7-64-agl-linux \
    PATH=${AGL_BASE}/sysroots/x86_64-aglsdk-linux/usr/bin/x86_64-agl-linux:$PATH

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

RUN apt-get update \
	&& apt-get install -y make wget patch python3 \
	&& wget --no-verbose https://download.automotivelinux.org/AGL/release/koi/latest/qemux86-64/deploy/sdk/poky-agl-glibc-x86_64-agl-demo-platform-crosssdk-corei7-64-qemux86-64-toolchain-11.0.4.sh \
	&& chmod +x *.sh \
	&& ./poky*.sh \
	&& rm *.sh \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo "source ${AGL_BASE}/environment-setup-corei7-64-agl-linux" >> ~/.bashrc
