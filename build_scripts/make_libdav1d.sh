#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
# cd $SRC && \
# git clone https://code.videolan.org/videolan/dav1d.git

echo "\n\n \
  ***************** \n \
  building libdav1d \n \
  ***************** \n" && \
\
cd $SRC/dav1d && \
git pull && \
mkdir -p build && \
cd build && \
meson setup -Denable_tools=false -Denable_tests=false --default-library=static .. --prefix "$INSTALL" --libdir="$INSTALL/lib" && \
ninja -j$(nproc) && \
ninja install
