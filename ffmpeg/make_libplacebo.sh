#!/bin/zsh
source ~/.zshrc

echo "\n\n \
  ************* \n \
  building libplacebo \n \
  ************* \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
git clone --recursive https://code.videolan.org/videolan/libplacebo && \
mkdir -p libplacebo/build && \
cd libplacebo/build && \
meson .. --prefix "$HOME/ffmpeg/ffmpeg_build" --libdir="$HOME/ffmpeg/ffmpeg_build/lib" -Dvulkan-registry="$VULKAN_SDK/share/vulkan/registry/vk.xml"
ninja -j$(nproc) && \
ninja install
