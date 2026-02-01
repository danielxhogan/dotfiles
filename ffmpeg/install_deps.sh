#!/bin/zsh
source ~/.zshrc

echo "\n\n \
  *********************** \n \
  installing dependencies \n \
  *********************** \n" && \
\
sudo apt-get update -qq && sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libgnutls28-dev \
  libmp3lame-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libopus-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  meson \
  ninja-build \
  pkg-config \
  texinfo \
  wget \
  yasm \
  zlib1g-dev \
  v4l-utils \
  nasm \
  libnuma-dev \
  libunistring-dev \
  libfdk-aac-dev \
  libxcb-xinput0 \
  libxcb-xinerama0 \
  libxcb-cursor-dev
