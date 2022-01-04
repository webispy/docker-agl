FROM ubuntu:latest

RUN apt-get update \
	&& apt-get install -y wget python3 \
	&& wget https://download.automotivelinux.org/AGL/release/koi/latest/raspberrypi4/deploy/sdk/poky-agl-glibc-x86_64-agl-demo-platform-crosssdk-aarch64-raspberrypi4-64-toolchain-11.0.4.sh \
	&& chmod +x *.sh \
	&& ./poky*.sh \
	&& rm *.sh \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

