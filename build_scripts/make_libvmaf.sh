#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
# cd $SRC && \
# git clone https://github.com/Netflix/vmaf.git

echo "\n\n \
  **************** \n \
  building libvmaf \n \
  **************** \n" && \
\
cd "$SRC/vmaf/libvmaf" && \
git pull && \
mkdir -p build &&\
cd build && \
meson setup -Denable_tests=false -Denable_docs=false --buildtype=release --default-library=static .. --prefix "$INSTALL" --bindir="$INSTALL/bin" --libdir="$INSTALL/lib" && \
ninja -j$(nproc) && \
ninja install
