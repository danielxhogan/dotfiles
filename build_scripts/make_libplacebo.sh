#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
cd $SRC && \
git clone --recursive https://code.videolan.org/danielxhogan/libplacebo.git && \
cd libplacebo && \
git remote add upstream https://code.videolan.org/videolan/libplacebo.git

# install dependencies
# ********************
# ./get_vulkan.sh
# ./make_libdovi.sh

echo "\n\n \
  ******************* \n \
  building libplacebo \n \
  ******************* \n" && \
\
cd $SRC/libplacebo && \
git fetch --all && \
git checkout master && \
git rebase upstream/master && \
mkdir -p build && \
cd build && \
meson setup .. --prefix "$INSTALL" --libdir="$INSTALL/lib" -Dvulkan-registry="$VULKAN_SDK/share/vulkan/registry/vk.xml" && \
ninja -j$(nproc) && \
ninja install
